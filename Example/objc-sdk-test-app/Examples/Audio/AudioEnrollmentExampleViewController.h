//
//  AudioEnrollmentExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/7/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef AudioEnrollmentExampleViewController_h
#define AudioEnrollmentExampleViewController_h

#import <UIKit/UIKit.h>
#import <objc_sdk/AudioStreamInteractor.h>
#import <objc_sdk/AudioService.h>

@interface AudioEnrollmentExampleViewController : UIViewController <SENAudioStreamDelegate, GRPCProtoResponseHandler>

@end

#endif /* AudioEnrollmentExampleViewController_h */
