//
//  SVProgressHUD+YXG_Extensions.m
//  YXG_Helper
//
//  Created by  on 2019/1/23.
//  Copyright © 2019 sun. All rights reserved.
//

#import "SVProgressHUD+YXG_Extensions.h"

@implementation SVProgressHUD (YXG_Extensions)
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
