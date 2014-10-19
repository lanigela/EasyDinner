//
//  ClientProcessingViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-10-3.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientProcessingViewController.h"

@implementation ClientProcessingViewController
@synthesize processingLabel = _processingLabel;
@synthesize processingIndicator = _processingIndicator;




-(UILabel*)processingLabel
{
    if (!_processingLabel){
        _processingLabel = [[UILabel alloc] init];
    }
    return _processingLabel;
}

-(UIActivityIndicatorView*)processingIndicator
{
    if (!_processingIndicator) {
        _processingIndicator = [[UIActivityIndicatorView alloc] init];
    }
    return _processingIndicator;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.processingLabel setText:@"Processing..."];
    self.processingLabel.frame = CGRectMake(0, 100, 100, 100);
    [self.processingLabel setCenter:CGPointMake(self.view.center.x, self.view.center.y + 100)];
    [self.processingLabel setTextColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.processingLabel];
    
    [self.processingIndicator setCenter:self.view.center];
    [self.processingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:self.processingIndicator];
    [self.processingIndicator startAnimating];
    
    self.view.layer.backgroundColor = [UIColor blackColor].CGColor;
    self.view.layer.opacity = 0.5;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
@end
