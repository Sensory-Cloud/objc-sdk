//
//  ValidateLivenessExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/6/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef ValidateLivenessExampleViewController_h
#define ValidateLivenessExampleViewController_h

#import <UIKit/UIKit.h>
#import <objc_sdk/VideoStreamInteractor.h>
#import <objc_sdk/VideoService.h>

@interface ValidateLivenessExampleViewController : UIViewController <SENVideoStreamDelegate, GRPCProtoResponseHandler>

/// Preview view that displays the preview layer
@property (weak, nonatomic) IBOutlet UIView *previewView;

/// Preview layer that shows the camera preview
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end


#endif /* ValidateLivenessExampleViewController_h */
