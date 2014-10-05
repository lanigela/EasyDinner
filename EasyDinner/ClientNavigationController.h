//
//  ClientNavigationController.h
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-29.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClientProcessingViewController.h"

@interface ClientNavigationController : UINavigationController

@property (strong, nonatomic)ClientProcessingViewController *cpvc;

-(void) startProcessing;

-(void) endProcessing;

@end
