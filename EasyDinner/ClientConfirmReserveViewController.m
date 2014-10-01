//
//  ClientConfirmReserveViewController.m
//  EasyDinner
//
//  Created by ZhouMeng on 14-9-30.
//  Copyright (c) 2014年 DreamChou. All rights reserved.
//

#import "ClientConfirmReserveViewController.h"

@implementation ClientConfirmReserveViewController

- (IBAction)CancelReserve:(id)sender {
    [self.ReserveInfo deleteInBackground];
    self.ReserveInfo = nil;
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Your reservation has been canceled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    //[self performSegueWithIdentifier:@"ReserveCanceled" sender:self];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
