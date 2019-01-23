//
//  SVProgressHUD+yxghelper.m
//  YXG_Helper
//
//  Created by  on 2019/1/21.
//  Copyright © 2019 sun. All rights reserved.
//

#import "SVProgressHUD+yxghelper.h"

@implementation SVProgressHUD (yxghelper)
+ (void)yxg_ShowError:(NSString *)errorString {
    [SVProgressHUD showErrorWithStatus:errorString];
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)yxg_ShowSuccess:(NSString *)successString {
    [SVProgressHUD showSuccessWithStatus:successString];
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)yxg_DismissAndShowError:(NSString *)errorString {
    [SVProgressHUD dismiss];
    [SVProgressHUD yxg_ShowError:errorString];
}

+ (void)yxg_DismissAndShowSuccess:(NSString *)successString {
    [SVProgressHUD dismiss];
    [SVProgressHUD yxg_ShowSuccess:successString];
}
@end
