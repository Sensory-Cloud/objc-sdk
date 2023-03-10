//
//  ValidateTriggerExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/2/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef ValidateTriggerExampleViewController_h
#define ValidateTriggerExampleViewController_h

#import <UIKit/UIKit.h>
#import <SensoryCloud/AudioStreamInteractor.h>
#import <SensoryCloud/AudioService.h>

@interface ValidateTriggerExampleViewController : UIViewController <SENAudioStreamDelegate, GRPCProtoResponseHandler>

@end

#endif /* ValidateTriggerExampleViewController_h */
