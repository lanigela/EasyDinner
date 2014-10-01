//
//  ClientResearveViewController.h
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-29.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"

@interface ClientResearveViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) PFObject* ReserveInfo;

@end
