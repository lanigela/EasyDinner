//
//  ClientConfirmWalkInViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-10-1.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientConfirmWalkInViewController.h"
#import "AppDelegate.h"


@interface ClientConfirmWalkInViewController()

@property (weak, nonatomic) IBOutlet UILabel *LineInfo;

@end

@implementation ClientConfirmWalkInViewController

- (IBAction)CancelWalkIn:(id)sender {
    //[self.WalkInInfo deleteInBackground];
    //self.WalkInInfo = nil;
    AppDelegate* app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    ClientNavigationController* cnc = (ClientNavigationController*)self.navigationController;
    [cnc startProcessing];
    [PFCloud callFunctionInBackground:@"CancelReservation" withParameters:@{@"deviceToken":app.installation.deviceToken} block:^(id object, NSError *error) {
        [cnc endProcessing];
    }];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"You have left the line!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    //[self performSegueWithIdentifier:@"ReserveCanceled" sender:self];
    [self.navigationController popToRootViewControllerAnimated:YES];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [PFCloud callFunctionInBackground:@"MyRank" withParameters:@{@"deviceToken":app.installation.deviceToken} block:^(NSString* object, NSError *error) {
        self.LineInfo.text = [NSString stringWithFormat:@"You are No.%@\n in the line!",object];}];
    /*PFQuery * query = [PFQuery queryWithClassName:@"LineInfo"];
    [query whereKey:@"deviceToken" equalTo:app.installation.deviceToken];
    NSArray* results = [query findObjects];
    for(PFObject *obj in results){
        NSLog(obj.objectId);
    }*/
    
}

@end
