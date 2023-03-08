//
//  VisionAuthenticationExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/8/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef VisionAuthenticationExampleViewController_h
#define VisionAuthenticationExampleViewController_h

#import <UIKit/UIKit.h>
#import <SensoryCloud/VideoStreamInteractor.h>
#import <SensoryCloud/VideoService.h>

@interface VisionAuthenticationExampleViewController : UIViewController <SENVideoStreamDelegate, GRPCProtoResponseHandler>

/// Preview view that displays the preview layer
@property (weak, nonatomic) IBOutlet UIView *previewView;

/// Preview layer that shows the camera preview
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

#endif /* VisionAuthenticationExampleViewController_h */
