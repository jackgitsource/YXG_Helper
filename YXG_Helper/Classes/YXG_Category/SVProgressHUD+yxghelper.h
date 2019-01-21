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

+ (void)YXG_ShowError:(NSString *)errorString;
+ (void)YXG_ShowSuccess:(NSString *)successString;
+ (void)YXG_DismissAndShowError:(NSString *)errorString;
+ (void)YXG_DismissAndShowSuccess:(NSString *)successString;
@end

NS_ASSUME_NONNULL_END
