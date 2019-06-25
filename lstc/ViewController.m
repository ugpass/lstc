//
//  ViewController.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "ViewController.h"
#import "LSRequest.h"
#import "LSTCViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)jumptoNext:(id)sender {
    LSTCViewController *vc = [[LSTCViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad]; 
}


@end
