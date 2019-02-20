//
//  NSString+YXG_Universal.m
//  SPIC-120
//
//  Created by  on 2019/1/9.
//

#import "NSString+YXG_Universal.h"

@implementation NSString (YXG_Universal)

- (NSString *)replaceNull {
    if (!self || self.length == 0) {
        return @"";
    }
    return self;
}
@end
