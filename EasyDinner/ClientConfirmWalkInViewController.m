//
//  ClientConfirmWalkInViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-10-1.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientConfirmWalkInViewController.h"


@interface ClientConfirmWalkInViewController()

@property (weak, nonatomic) IBOutlet UILabel *LineInfo;

@end

@implementation ClientConfirmWalkInViewController

- (IBAction)CancelWalkIn:(id)sender {
    [self.WalkInInfo deleteInBackground];
    self.WalkInInfo = nil;
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"You have left the line!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    //[self performSegueWithIdentifier:@"ReserveCanceled" sender:self];
    [self.navigationController popToRootViewControllerAnimated:YES];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    PFQuery *query = [PFQuery queryWithClassName:@"LineInfo"];
    [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (!error) {
            self.LineInfo.text = [NSString stringWithFormat:@"You are No.%d\nin the line", number+1];
        }
    }];
}

@end
