//
//  ViewController.m
//  YXG_HelperDemo
//
//  Created by  on 2019/1/24.
//  Copyright © 2019 everfine. All rights reserved.
//

#import "ViewController.h"
#import "YXG_HelperDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BasicTestViewController *basicVC = [[BasicTestViewController alloc] init];
    [self.navigationController pushViewController:basicVC animated:YES];
}


@end
