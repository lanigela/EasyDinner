//
//  ClientMainViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-29.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "AppDelegate.h"
#import "ClientMainViewController.h"
#import <parse/Parse.h>

@interface ClientMainViewController()
@property Boolean isReserved;
@property Boolean isTokenReady;
@property (weak, nonatomic) IBOutlet UIButton *ReserveButton;
@property (weak, nonatomic) IBOutlet UIButton *WalkInButton;
@property (weak, nonatomic) IBOutlet UIButton *ReserveInfoButton;
@end

@implementation ClientMainViewController

-(void)tokenReady
{
    [self CheckReserveStatus];
    self.isTokenReady = YES;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.isReserved = NO;
    self.isTokenReady = NO;
    [self updateView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isTokenReady) {
        [self CheckReserveStatus];
        [self updateView];
    }
}

-(void)CheckReserveStatus
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    ClientNavigationController* cnc = (ClientNavigationController*)self.navigationController;
    [cnc startProcessing];
    [PFCloud callFunctionInBackground:@"IsReserved" withParameters:@{@"deviceToken":app.installation.deviceToken} block:^(NSString* object, NSError *error) {
        if ([object isEqualToString:@"reserved"]) {
            self.isReserved = YES;
            [self updateView];
        }
        else{
            self.isReserved = NO;
            [self updateView];
        }
        [cnc endProcessing];
    }];
}

-(void)updateView
{
    if(self.isReserved){
        [self.ReserveButton setEnabled:NO];
        [self.WalkInButton setEnabled:NO];
        [self.ReserveInfoButton setTitle:@"You have reserved seat. \nClick to see detail" forState:UIControlStateNormal];
        [self.ReserveInfoButton setEnabled:YES];
    }
    else{
        [self.ReserveButton setEnabled:YES];
        [self.WalkInButton setEnabled:YES];
        [self.ReserveInfoButton setTitle:@"" forState:UIControlStateNormal];
        [self.ReserveInfoButton setEnabled:NO];
    }
}

@end
