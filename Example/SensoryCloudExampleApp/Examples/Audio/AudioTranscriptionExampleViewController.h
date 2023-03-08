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
#import <SensoryCloud/AudioStreamInteractor.h>
#import <SensoryCloud/AudioService.h>

@interface AudioTranscriptionExampleViewController: UIViewController <SENAudioStreamDelegate, GRPCProtoResponseHandler>

@end

#endif /* AudioTranscriptionExampleViewController_h */
