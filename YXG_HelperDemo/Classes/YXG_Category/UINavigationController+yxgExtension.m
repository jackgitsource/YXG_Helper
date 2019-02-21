//
//  UINavigationController+yxgExtension.m
//  YXG_KitDemo
//
//  Created by  on 2019/1/28.
//  Copyright © 2019 everfine. All rights reserved.
//

#import "UINavigationController+yxgExtension.h"

@implementation UINavigationController (yxgExtension)

- (void)setBackColor:(UIColor *)color trunslucent:(BOOL)trunslucent {
    [self.navigationBar setBarTintColor:color];
    self.navigationBar.translucent = trunslucent;
}

- (void)setTitleColor:(UIColor *)color {
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}

@end
