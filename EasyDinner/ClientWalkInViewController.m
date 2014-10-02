//
//  ClientWalkInViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-30.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientWalkInViewController.h"
#import "ClientConfirmWalkInViewController.h"
#import "AppDelegate.h"

@interface ClientWalkInViewController()
@property (weak, nonatomic) IBOutlet UITextField *WalkInInfoPhone;
@property (weak, nonatomic) IBOutlet UITextField *WalkInInfoName;
@end

@implementation ClientWalkInViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
    
    self.WalkInInfoPhone.delegate = self;
    self.WalkInInfoName.delegate = self;
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
    if ([segue.identifier isEqualToString:@"WalkInSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[ClientConfirmWalkInViewController class]]) {
            ClientConfirmWalkInViewController *cwvcc = (ClientConfirmWalkInViewController*)segue.destinationViewController;
            cwvcc.WalkInInfo = self.WalkInInfo;
            NSLog(@"yeah!");
        }
    }
}

- (IBAction)GetInLine:(id)sender {
    self.WalkInInfo = [PFObject objectWithClassName:@"LineInfo"];
    self.WalkInInfo[@"name"] = self.WalkInInfoName.text;
    self.WalkInInfo[@"phone"] = self.WalkInInfoPhone.text;
    self.WalkInInfo[@"type"] = @"walkin";
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.WalkInInfo[@"deviceToken"] = app.installation.deviceToken;
    PFACL *groupACL = [PFACL ACL];
    [groupACL setPublicWriteAccess:YES];
    [groupACL setPublicReadAccess:YES];
    self.WalkInInfo.ACL = groupACL;
    [self.WalkInInfo saveInBackground];
    [self performSegueWithIdentifier:@"WalkInSegue" sender:self];
}

@end
