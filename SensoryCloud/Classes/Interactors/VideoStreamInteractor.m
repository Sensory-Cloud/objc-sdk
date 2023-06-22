//
//  VideoStreamInteractor.m
//  objc-sdk
//
//  Created by Niles Hacking on 3/6/23.
//

#import <Foundation/Foundation.h>
#import "VideoStreamInteractor.h"
#import <AVFoundation/AVFoundation.h>

static NSString * const kErrorDomain = @"ai.SensoryCloud.VideoStreamInteractor";

int targetWidth = 480;
int targetHeight = 720;

@interface SENVideoStreamInteractor ()
@property dispatch_queue_t videoQueue;
@property bool configured;
@property bool photoRequested;
@end

@implementation SENVideoStreamInteractor

+ (instancetype) sharedInstance {
    static SENVideoStreamInteractor *instance = nil;
    if (!instance) {
        instance = [self alloc];
        instance.session = [[AVCaptureSession alloc] init];
        instance.jpegCompression = 0.95;
        instance.orientation = AVCaptureVideoOrientationPortrait;
        dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INTERACTIVE, -1);
        instance.videoQueue = dispatch_queue_create("videoInteractorQueue", qos);
        instance.configured = false;
        instance.photoRequested = false;
    }
    return instance;
}

-(void)setJpegCompression:(double)jpegCompression {
    if (jpegCompression < 0) {
        _jpegCompression = 0;
    } else if (jpegCompression > 1) {
        _jpegCompression = 1;
    } else {
        _jpegCompression = jpegCompression;
    }
}

-(void) requestVideoPermission: (void (^)(BOOL))callback {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:callback];
}

-(bool) configure: (out NSError**)error {
    if (self.configured) {
        return true;
    }

    [self.session beginConfiguration];

    self.session.sessionPreset = AVCaptureSessionPresetHigh;

    // Camera input
    AVCaptureDeviceInput* input = [self getCameraForPosition:kFront errorPtr:error];
    if (input == nil) {
        [self.session commitConfiguration];
        return false;
    }
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
    } else {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not add camera input" status:errSecInternalError];
        }
        [self.session commitConfiguration];
        return false;
    }

    // Video output
    AVCaptureVideoDataOutput* output = [[AVCaptureVideoDataOutput alloc] init];
    output.videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA], (id)kCVPixelBufferPixelFormatTypeKey, nil];
    AVCaptureConnection* connection = [output connectionWithMediaType:AVMediaTypeVideo];
    if (connection != nil) {
        connection.automaticallyAdjustsVideoMirroring = false;
        connection.videoOrientation = self.orientation;
    }
    [output setSampleBufferDelegate:self queue:self.videoQueue];
    if ([self.session canAddOutput:output]) {
        [self.session addOutput:output];
    } else {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not add camera output" status:errSecInternalError];
        }
        [self.session commitConfiguration];
        return false;
    }

    self.configured = true;
    [self.session commitConfiguration];
    return true;
}

-(bool) startRecording: (out NSError**)error {
    if (!self.configured) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"VideoStreamInteractor must be configured first" status:errSecInvalidAction];
        }
        return false;
    }

    [self.session startRunning];
    return true;
}

-(void) stopRecording {
    [self.session stopRunning];
}

-(bool) setCameraPositionTo: (SENCameraPosition)position errorPtr: (out NSError**)error {
    [self.session beginConfiguration];

    for (AVCaptureInput* input in self.session.inputs) {
        [self.session removeInput:input];
    }

    AVCaptureDeviceInput* input = [self getCameraForPosition:position errorPtr:error];
    if (input == nil) {
        [self.session commitConfiguration];
        return false;
    }
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
    } else {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Could not add camera input" status:errSecInternalError];
        }
        [self.session commitConfiguration];
        return false;
    }

    [self.session commitConfiguration];
    return true;
}

-(void) takePhoto {
    if (![self.session isRunning]) {
        NSError* error = [self generateErrorWithDescription:@"Camera session must be running to take photo" status:errSecInvalidAction];
        [self.delegate takePhotoFailedWithError: error];
        return;
    }

    self.photoRequested = true;
}

-(AVCaptureDeviceInput*) getCameraForPosition: (SENCameraPosition)position errorPtr: (out NSError**)error {

    AVCaptureDevicePosition avPosition;
    switch(position) {
        case kFront:
            avPosition = AVCaptureDevicePositionBack;
        case kBack:
            avPosition = AVCaptureDevicePositionFront;
    }

    AVCaptureDevice* device = [AVCaptureDevice defaultDeviceWithDeviceType: AVCaptureDeviceTypeBuiltInWideAngleCamera
                                                                 mediaType: AVMediaTypeVideo
                                                                  position: avPosition];
    if (device == nil) {
        if (error != nil) {
            *error = [self generateErrorWithDescription:@"Cannot find camera input" status:errSecNotAvailable];
        }
        return nil;
    }

    return [AVCaptureDeviceInput deviceInputWithDevice:device error:error];
}

- (NSError*)generateErrorWithDescription: (NSString*)description status:(OSStatus)status {
    NSString* statusStr = [NSString stringWithFormat:@"%d", status];
    NSString* statusMsg = (__bridge_transfer NSString*) SecCopyErrorMessageString(status, nil);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description, @"osStatus": statusStr, @"statusMsg": statusMsg};
    return [NSError errorWithDomain:kErrorDomain code:status userInfo:userInfo];
}

// AVCaptureVideoDataOutputSampleBufferDelegate conformance
-(void) captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{

    // Make sure that the connection is using the correct orientation
    if (connection.videoOrientation != [self orientation]) {
        connection.videoOrientation = [self orientation];
    }

    if (!self.photoRequested) {
        return;
    }
    self.photoRequested = false;

    if (!self.delegate) {
        return;
    }

    CGImageRef image = [self getImageFromBuffer:sampleBuffer];
    if (!image) {
        NSError* error = [self generateErrorWithDescription:@"Could not export generated photo" status:errSecInternalError];
        [self.delegate takePhotoFailedWithError:error];
        return;
    }

    NSData* data = [self imagePostProcessingFor:image];
    if (!data) {
        NSError* error = [self generateErrorWithDescription:@"Could not export generated photo" status:errSecInternalError];
        [self.delegate takePhotoFailedWithError:error];
        return;
    }

    [self.delegate didTakePhoto:data];
}

-(CGImageRef) getImageFromBuffer: (CMSampleBufferRef)sampleBuffer {
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    if (!imageBuffer) {
        return nil;
    }

    CVPixelBufferLockBaseAddress(imageBuffer, kCVPixelBufferLock_ReadOnly);
    CGContextRef context = CGBitmapContextCreateWithData(
                                                         CVPixelBufferGetBaseAddress(imageBuffer),
                                                         CVPixelBufferGetWidth(imageBuffer),
                                                         CVPixelBufferGetHeight(imageBuffer),
                                                         8,
                                                         CVPixelBufferGetBytesPerRow(imageBuffer),
                                                         CGColorSpaceCreateDeviceRGB(),
                                                         kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst,
                                                         NULL,
                                                         NULL);
    if (!context) {
        CVPixelBufferUnlockBaseAddress(imageBuffer, kCVPixelBufferLock_ReadOnly);
        return nil;
    }

    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CVPixelBufferUnlockBaseAddress(imageBuffer, kCVPixelBufferLock_ReadOnly);
    return cgImage;
}

-(NSData*) imagePostProcessingFor: (CGImageRef)baseImage {
    // Some of the math here may look off
    // For some reason, the preview image comes with a 90 degree rotation
    // It's easiest to un-rotate the image at the end, but it makes the width/heights confusing

    int width = targetWidth;
    int height = targetHeight;

    // First correct the aspect ratio of the image
    CGImageRef croppedImage;
    double targetAspectRatio = ((double)height)/((double)width);
    double baseAspectRatio = ((double)CGImageGetWidth(baseImage))/((double)CGImageGetHeight(baseImage));
    if (targetAspectRatio < baseAspectRatio) {
        // crop width to match aspect ratio
        double delta = (int)((double)CGImageGetWidth(baseImage) - targetAspectRatio * (double)CGImageGetHeight(baseImage));
        CGRect cropRect = CGRectMake(delta/2, 0, CGImageGetWidth(baseImage) - delta, CGImageGetHeight(baseImage));
        croppedImage = CGImageCreateWithImageInRect(baseImage, cropRect);
    } else {
        // crop height to match aspect ratio
        double delta = (int)((double)CGImageGetHeight(baseImage) - (1.0/targetAspectRatio) * (double)CGImageGetWidth(baseImage));
        CGRect cropRect = CGRectMake(0, delta/2, CGImageGetWidth(baseImage), CGImageGetHeight(baseImage) - delta);
        croppedImage = CGImageCreateWithImageInRect(baseImage, cropRect);
    }
    CGImageRelease(baseImage);
    if (!croppedImage) {
        return nil;
    }

    // Scale the image to the proper size
    CGContextRef context = CGBitmapContextCreateWithData(
                                                         nil,
                                                         height,
                                                         width,
                                                         CGImageGetBitsPerComponent(croppedImage),
                                                         CGImageGetBytesPerRow(croppedImage),
                                                         CGColorSpaceCreateDeviceRGB(),
                                                         kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst,
                                                         NULL,
                                                         NULL);
    if (!context) {
        return nil;
    }
    CGRect scaleRect = CGRectMake(0, 0, targetHeight, targetWidth);
    CGContextDrawImage(context, scaleRect, croppedImage);
    CGImageRef resizedImage = CGBitmapContextCreateImage(context);
    CGImageRelease(croppedImage);
    CGContextRelease(context);
    if (!resizedImage) {
        return nil;
    }

    // Export as JPEG
    UIImage* finalImage = [[UIImage alloc] initWithCGImage:resizedImage scale:1 orientation:UIImageOrientationRight];
    NSData* jpegData = UIImageJPEGRepresentation(finalImage, _jpegCompression);
    CGImageRelease(resizedImage);
    return jpegData;
}

@end
