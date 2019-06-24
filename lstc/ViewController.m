//
//  ViewController.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "ViewController.h"
#import "LSRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LSRequest *request = [[LSRequest alloc] init];
    [request getToken:kRequestToken method:GET];
}


@end
