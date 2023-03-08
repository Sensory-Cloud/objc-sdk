//
//  VisionEnrollmentExampleViewController.h
//  objc-sdk
//
//  Created by Niles Hacking on 3/8/23.
//  Copyright © 2023 Niles Hacking. All rights reserved.
//

#ifndef VisionEnrollmentExampleViewController_h
#define VisionEnrollmentExampleViewController_h

#import <UIKit/UIKit.h>
#import <objc_sdk/VideoStreamInteractor.h>
#import <objc_sdk/VideoService.h>

@interface VisionEnrollmentExampleViewController : UIViewController <SENVideoStreamDelegate, GRPCProtoResponseHandler>

/// Preview view that displays the preview layer
@property (weak, nonatomic) IBOutlet UIView *previewView;

/// Preview layer that shows the camera preview
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

#endif /* VisionEnrollmentExampleViewController_h */
