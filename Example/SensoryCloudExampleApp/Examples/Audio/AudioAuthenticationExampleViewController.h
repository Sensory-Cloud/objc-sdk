//
//  AudioAuthenticationExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/7/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef AudioAuthenticationExampleViewController_h
#define AudioAuthenticationExampleViewController_h

#import <UIKit/UIKit.h>
#import <SensoryCloud/AudioStreamInteractor.h>
#import <SensoryCloud/AudioService.h>

@interface AudioAuthenticationExampleViewController: UIViewController <SENAudioStreamDelegate, GRPCProtoResponseHandler>

@end

#endif /* AudioAuthenticationExampleViewController_h */
