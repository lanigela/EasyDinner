//
//  ClientWalkInViewController.h
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-30.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"



@interface ClientWalkInViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) PFObject * WalkInInfo;

@end
