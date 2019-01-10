//
//  UIAlertController+YXG_UniversalAlert.m
//  SPIC-120
//
//  Created by  on 2019/1/9.
//

#import "UIAlertController+YXG_UniversalAlert.h"
#import "NSObject+YXG_Helper.h"

@implementation UIAlertController (YXG_UniversalAlert)

+ (void)showTextFieldAlertWithTitle:(NSString *)title
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelTitle
                            okTitle:(NSString *)okTitle
                           callback:(void(^)(NSString *content))callback {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = title;
    }];
    [alertVC addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil]];
    [alertVC addAction:[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textF = alertVC.textFields.firstObject;
        if (callback) callback(textF.text);
    }]];
    [[self YXG_CurrentViewController] presentViewController:alertVC animated:YES completion:nil];
}
@end
