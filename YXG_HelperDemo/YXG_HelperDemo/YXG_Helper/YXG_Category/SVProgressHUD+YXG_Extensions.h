//
//  SVProgressHUD+YXG_Extensions.h
//  YXG_Helper
//
//  Created by  on 2019/1/23.
//  Copyright © 2019 sun. All rights reserved.
//

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (YXG_Extensions)
+ (void)yxg_ShowError:(NSString *)errorString;
+ (void)yxg_ShowSuccess:(NSString *)successString;
+ (void)yxg_DismissAndShowError:(NSString *)errorString;
+ (void)yxg_DismissAndShowSuccess:(NSString *)successString;
@end

NS_ASSUME_NONNULL_END
