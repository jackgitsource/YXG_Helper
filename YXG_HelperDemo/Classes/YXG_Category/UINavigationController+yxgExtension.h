//
//  UINavigationController+yxgExtension.h
//  YXG_KitDemo
//
//  Created by  on 2019/1/28.
//  Copyright © 2019 everfine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (yxgExtension)

/**
 背景颜色
 @param trunslucent yes导致颜色被遮挡,系统trunslucent默认yes
 */
- (void)setBackColor:(UIColor *)color trunslucent:(BOOL)trunslucent;
/**
 标题颜色
 */
- (void)setTitleColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
