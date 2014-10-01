//
//  ClientResearveViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-29.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientResearveViewController.h"
#import "Parse/Parse.h"

@interface ClientResearveViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TextFieldName;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldPhone;

@end

@implementation ClientResearveViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (IBAction)ReserveForSeat:(UIButton *)sender {
    PFObject *reserveInfo = [PFObject objectWithClassName:@"ReserveInfo"];
    reserveInfo[@"name"] = self.TextFieldName.text;
    reserveInfo[@"phone"] = self.TextFieldPhone.text;
    [reserveInfo saveInBackground];
    [self performSegueWithIdentifier:@"ReserveSegue" sender:self];
}

@end
