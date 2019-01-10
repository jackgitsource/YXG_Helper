//
//  UIAlertController+YXG_UniversalAlert.h
//  SPIC-120
//
//  Created by  on 2019/1/9.
//  Copyright © 2019 everfine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (YXG_UniversalAlert)

+ (void)showTextFieldAlertWithTitle:(NSString *)title
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
                            okTitle:(NSString *)okTitle
                           callback:(void(^)(NSString *content))callback;
@end

NS_ASSUME_NONNULL_END
