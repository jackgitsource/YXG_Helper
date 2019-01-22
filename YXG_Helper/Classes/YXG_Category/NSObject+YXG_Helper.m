//
//  NSObject+YXG_Helper.m
//  SPIC-120
//
//  Created by  on 2019/1/9.
//

#import "NSObject+YXG_Helper.h"

@implementation NSObject (YXG_Helper)

/**
 获取当前的控制器
  @return 当前控制器
 */
+ (UIViewController *)yxg_CurrentViewController {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    for (UIView *subView in [window subviews]) {
        UIResponder *responder = [subView nextResponder];
        if ([responder isEqual:window]) {
            if ([[subView subviews] count]) {
                UIView *subSubView = [subView subviews][0];
                responder = [subSubView nextResponder];
            }
        }
        if([responder isKindOfClass:[UIViewController class]]) {
            return [NSObject YXG_TopViewController:((UIViewController *) responder)];
        }
    }
    
    return window.rootViewController;
}

+ (UIViewController *)yxg_TopViewController:(UIViewController *)controller {
    BOOL isPresenting = NO;
    do {
        UIViewController *presented = [controller presentedViewController];
        isPresenting = presented != nil;
        if(presented != nil) {
            controller = presented;
        }
    } while (isPresenting);
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = ((UITabBarController *) controller).selectedViewController;
    }
    if ([controller isKindOfClass:[UINavigationController class]]) {
        controller = [((UINavigationController *) controller).viewControllers lastObject];
    }
    return controller;
}
@end
