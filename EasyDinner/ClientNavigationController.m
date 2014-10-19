//
//  ClientNavigationController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-29.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientNavigationController.h"

@implementation ClientNavigationController
@synthesize cpvc = _cpvc;


-(ClientProcessingViewController*)cpvc
{
    if (!_cpvc) {
        _cpvc = [[ClientProcessingViewController alloc] init];
        _cpvc.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    return _cpvc;
}
-(void) deviceTokenReady
{
    for (NSObject* obj in self.viewControllers) {
        if ([obj isKindOfClass:[ClientMainViewController class]]) {
            ClientMainViewController* cmvc = (ClientMainViewController*)obj;
            [cmvc tokenReady];
        }
    }
}

-(void) QRCodeNotMatch
{
    
}

-(void) viewDidLoad
{
    [super viewDidLoad];
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void) startProcessing
{
    [self.view addSubview:self.cpvc.view];
    [self.cpvc viewWillAppear:YES];
}
-(void) endProcessing
{
    [self.cpvc.view removeFromSuperview];
    [self.cpvc viewWillDisappear:YES];
}

@end
