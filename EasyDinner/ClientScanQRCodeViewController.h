//
//  ClientScanQRCodeViewController.h
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-30.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ClientScanQRCodeViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>

@property AVCaptureDevice *device;
@property AVCaptureDeviceInput *input;
@property AVCaptureMetadataOutput *output;
@property AVCaptureSession *session;
@property AVCaptureVideoPreviewLayer *preview;

-(void)SetupCamera;

@end
