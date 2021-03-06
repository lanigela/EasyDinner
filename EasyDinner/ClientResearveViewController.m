//
//  ClientResearveViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-29.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "AppDelegate.h"
#import "ClientResearveViewController.h"
#import "ClientConfirmReserveViewController.h"


@interface ClientResearveViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TextFieldName;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldPhone;



@end

@implementation ClientResearveViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.TextFieldName.delegate = self;
    self.TextFieldPhone.delegate = self;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y -=50;
    frame.size.height +=50;
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y += 50;
    frame.size. height -= 50;
    self.view.frame = frame;
    
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ReserveSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[ClientConfirmReserveViewController class]]) {
            ClientConfirmReserveViewController *ccrvc = (ClientConfirmReserveViewController*)segue.destinationViewController;
            ccrvc.ReserveInfo = self.ReserveInfo;
        }
    }
}


- (IBAction)ReserveForSeat:(UIButton *)sender {
    
    self.ReserveInfo = [PFObject objectWithClassName:@"LineInfo"];
    NSNumber *t = [NSNumber numberWithDouble:[NSDate timeIntervalSinceReferenceDate]];
    self.ReserveInfo[@"registertime"] = t;
    self.ReserveInfo[@"name"] = self.TextFieldName.text;
    self.ReserveInfo[@"phone"] = self.TextFieldPhone.text;
    self.ReserveInfo[@"type"] = @"reserve";
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.ReserveInfo[@"deviceToken"] = app.installation.deviceToken;
    PFACL *groupACL = [PFACL ACL];
    [groupACL setPublicWriteAccess:YES];
    [groupACL setPublicReadAccess:YES];
    self.ReserveInfo.ACL = groupACL;
    [self.ReserveInfo saveInBackground];
    [self performSegueWithIdentifier:@"ReserveSegue" sender:self];
}

@end
