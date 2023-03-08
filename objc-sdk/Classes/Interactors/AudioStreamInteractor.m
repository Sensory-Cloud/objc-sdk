//
//  AudioStreamInteractor.m
//  objc-sdk
//
//  Created by Niles Hacking on 3/3/23.
//

#import <Foundation/Foundation.h>
#import "AudioStreamInteractor.h"
#import <AVFoundation/AVFoundation.h>

static NSString * const kErrorDomain = @"ai.SensoryCloud.AudioStreamInteractor";

// Bus 1 is audio input
AudioUnitElement bus1 = 1;
// Sample audio at 16kHz
Float64 audioSampleRate = 16000;

@interface SENAudioStreamInteractor () {
    AudioComponentInstance microphoneUnit;
    bool configured;
}
@end

@implementation SENAudioStreamInteractor

+ (instancetype) sharedInstance {
    static SENAudioStreamInteractor *instance = nil;
    if (!instance) {
        instance = [self alloc];
    }
    return instance;
}

- (void) dealloc {
    AudioComponentInstanceDispose(microphoneUnit);
}

-(void) requestAudioPermission: (void (^)(BOOL))callback{
    AVAudioSession* session = [AVAudioSession sharedInstance];
    [session requestRecordPermission:callback];
}

-(bool) configure: (out NSError**)error {
    if (self->configured && (self->microphoneUnit != nil)) {
        return true;
    }

    if (![self configureAudioSession:error]) {
        return false;
    }

    AudioComponentDescription audioComponentDescription = [self describeComponent];

    AudioComponent audioComponent = AudioComponentFindNext(nil, &audioComponentDescription);
    AudioComponentInstanceNew(audioComponent, &(self->microphoneUnit));
    if (self->microphoneUnit == nil) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not create microphone instance" status:errSecInternalError];
        }        return false;
    }

    if (![self configureMicrophoneForInput:&(self->microphoneUnit) errorPtr:error]) {
        return false;
    }
    if (![self setFormatForMicrophone:&(self->microphoneUnit) errorPtr:error]) {
        return false;
    }
    if (![self setCallback:&(self->microphoneUnit) errorPtr:error]) {
        return false;
    }

    OSStatus status = AudioUnitInitialize(self->microphoneUnit);
    if (status != noErr) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not initialize microphone unit" status:status];
        }        return false;
    }

    self->configured = true;
    return true;
}

-(bool) startRecording: (out NSError**)error {
    if (!configured) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"AudioStreamInteractor must be configured first" status:errSecInvalidAction];
        }
        return false;
    }

    OSStatus status = AudioOutputUnitStart(self->microphoneUnit);
    if (status != noErr) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not start microphone recording" status:status];
        }
        return false;
    }
    return true;
}


-(bool) stopRecording: (out NSError**)error {
    if (self->microphoneUnit == nil) {
        return true;
    }

    OSStatus status = AudioOutputUnitStop(self->microphoneUnit);
    if (status != noErr) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not stop microphone recording" status:status];
        }
        return false;
    }
    return true;
}

-(bool) configureAudioSession: (out NSError**)error {
    AVAudioSession* session = [AVAudioSession sharedInstance];
    if (![session setCategory:AVAudioSessionCategoryPlayAndRecord error:error]) {
        return false;
    }
    return [session setPreferredIOBufferDuration:10 error:error];
}

-(AudioComponentDescription) describeComponent {
    struct AudioComponentDescription description;
    description.componentType = kAudioUnitType_Output;
    description.componentSubType = kAudioUnitSubType_RemoteIO;
    description.componentManufacturer = kAudioUnitManufacturer_Apple;
    description.componentFlags = 0;
    description.componentFlagsMask = 0;
    return description;
}

-(bool) configureMicrophoneForInput: (AudioComponentInstance*)microphone errorPtr: (out NSError**)error {
    UInt32 oneFlag = 1;
    OSStatus status = AudioUnitSetProperty(*microphone,
                                           kAudioOutputUnitProperty_EnableIO,
                                           kAudioUnitScope_Input,
                                           bus1,
                                           &oneFlag,
                                           sizeof(UInt32));

    if (status != noErr) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not set microphone as input" status:status];
        }        return false;
    }
    return true;
}

-(bool) setFormatForMicrophone: (AudioComponentInstance*)microphone errorPtr: (out NSError**)error {
    struct AudioStreamBasicDescription description;
    description.mSampleRate = audioSampleRate;
    description.mFormatID = kAudioFormatLinearPCM;
    description.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
    description.mBytesPerPacket = 2;
    description.mFramesPerPacket = 1;
    description.mBytesPerFrame = 2;
    description.mChannelsPerFrame = 1;
    description.mBitsPerChannel = 16;
    OSStatus status = AudioUnitSetProperty(*microphone,
                                           kAudioUnitProperty_StreamFormat,
                                           kAudioUnitScope_Output,
                                           bus1,
                                           &description,
                                           sizeof(AudioStreamBasicDescription));

    if (status != noErr) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not set microphone format" status:status];
        }
        return false;
    }
    return true;
}

-(bool) setCallback: (AudioComponentInstance*)microphone errorPtr: (out NSError**)error {
    struct AURenderCallbackStruct callbackStruct;
    callbackStruct.inputProc = recordingCallback;
    callbackStruct.inputProcRefCon = (__bridge void *) self;
    OSStatus status = AudioUnitSetProperty(*microphone,
                                           kAudioOutputUnitProperty_SetInputCallback,
                                           kAudioUnitScope_Global,
                                           bus1,
                                           &callbackStruct,
                                           sizeof(AURenderCallbackStruct));

    if (status != noErr) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not set microphone callback" status:status];
        }
        return false;
    }
    return true;
}

static OSStatus recordingCallback(void *inRefCon,
                                  AudioUnitRenderActionFlags* ioActionFlags,
                                  const AudioTimeStamp* inTimeStamp,
                                  UInt32 inBusNumber,
                                  UInt32 inNumberFrames,
                                  AudioBufferList* ioData) {

    SENAudioStreamInteractor* audioInteractor = (__bridge SENAudioStreamInteractor*) inRefCon;

    AudioBufferList *bufferList = (AudioBufferList *) malloc (sizeof (AudioBufferList));
    bufferList->mNumberBuffers = 1;
    bufferList->mBuffers[0].mNumberChannels = 1;
    bufferList->mBuffers[0].mDataByteSize = inNumberFrames * 2;
    bufferList->mBuffers[0].mData = nil;

    AudioComponentInstance* microphone = &(audioInteractor->microphoneUnit);
    if (microphone == nil) {
        return errSecCallbackFailed;
    }

    OSStatus status;
    status = AudioUnitRender(*microphone, ioActionFlags, inTimeStamp, inBusNumber, inNumberFrames, bufferList);
    if (status != noErr) {
        return status;
    }

    NSData *data = [[NSData alloc] initWithBytes:bufferList->mBuffers[0].mData length:bufferList->mBuffers[0].mDataByteSize];
    dispatch_async(dispatch_get_main_queue(), ^{
        [audioInteractor.delegate didProcessAudio:data];
    });

    return noErr;
}

- (NSError*)generateErrorWithDescription: (NSString*)description status:(OSStatus)status {
    NSString* statusStr = [NSString stringWithFormat:@"%d", status];
    NSString* statusMsg = (__bridge_transfer NSString*) SecCopyErrorMessageString(status, nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description, @"osStatus": statusStr, @"statusMsg": statusMsg};
    return [NSError errorWithDomain:kErrorDomain code:status userInfo:userInfo];
}

@end
