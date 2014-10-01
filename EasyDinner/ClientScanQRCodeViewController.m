//
//  ClientScanQRCodeViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-30.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//


#import "ClientScanQRCodeViewController.h"
#import "ClientWalkInViewController.h"



@implementation ClientScanQRCodeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self SetupCamera];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.session startRunning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"QRCodeScannedSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[ClientWalkInViewController class]]) {
            //ClientWalkInViewController *cwc = (ClientWalkInViewController *)segue.destinationViewController;
        }
    }
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0) {
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
    
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                      message:stringValue
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil,nil];
        [alert show];
    }];
    NSLog(@"QRCode Scanned!");
    [self performSegueWithIdentifier:@"QRCodeScannedSegue" sender:self];
}

-(void)SetupCamera
{
    // Device
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    self.output = [[AVCaptureMetadataOutput alloc]init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    self.session = [[AVCaptureSession alloc]init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([self.session canAddInput:self.input])
    {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output])
    {
        [self.session addOutput:self.output];
    }
    
    // Data type
    self.output.MetadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    
    // Preview
    self.preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.preview.videoGravity =AVLayerVideoGravityResizeAspectFill;
    self.preview.frame =CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    [self.view.layer addSublayer:self.preview];
    
    // Start
    [self.session startRunning];
}

@end
