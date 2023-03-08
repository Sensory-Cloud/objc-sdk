//
//  AudioTranscriptionExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/7/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef AudioTranscriptionExampleViewController_h
#define AudioTranscriptionExampleViewController_h

#import <UIKit/UIKit.h>
#import <objc_sdk/AudioStreamInteractor.h>
#import <objc_sdk/AudioService.h>

@interface AudioTranscriptionExampleViewController: UIViewController <SENAudioStreamDelegate, GRPCProtoResponseHandler>

@end

#endif /* AudioTranscriptionExampleViewController_h */
