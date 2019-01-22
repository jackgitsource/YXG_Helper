//
//  SVProgressHUD+yxghelper.h
//  YXG_Helper
//
//  Created by  on 2019/1/21.
//  Copyright © 2019 sun. All rights reserved.
//


#import <SVProgressHUD.h>
NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (yxghelper)

+ (void)yxg_ShowError:(NSString *)errorString;
+ (void)yxg_ShowSuccess:(NSString *)successString;
+ (void)yxg_DismissAndShowError:(NSString *)errorString;
+ (void)yxg_DismissAndShowSuccess:(NSString *)successString;
@end

NS_ASSUME_NONNULL_END
