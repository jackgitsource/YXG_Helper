//
//  SVProgressHUD+yxghelper.m
//  YXG_Helper
//
//  Created by  on 2019/1/21.
//  Copyright © 2019 sun. All rights reserved.
//

#import "SVProgressHUD+yxghelper.h"

@implementation SVProgressHUD (yxghelper)
+ (void)YXG_ShowError:(NSString *)errorString {
    [SVProgressHUD showErrorWithStatus:errorString];
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)YXG_ShowSuccess:(NSString *)successString {
    [SVProgressHUD showSuccessWithStatus:successString];
    [SVProgressHUD dismissWithDelay:2];
}

+ (void)YXG_DismissAndShowError:(NSString *)errorString {
    [SVProgressHUD dismiss];
    [SVProgressHUD YXG_ShowError:errorString];
}

+ (void)YXG_DismissAndShowSuccess:(NSString *)successString {
    [SVProgressHUD dismiss];
    [SVProgressHUD YXG_ShowSuccess:successString];
}
@end
