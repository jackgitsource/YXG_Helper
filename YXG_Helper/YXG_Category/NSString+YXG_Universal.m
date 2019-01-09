//
//  NSString+YXG_Universal.m
//  SPIC-120
//
//  Created by  on 2019/1/9.
//  Copyright © 2019 everfine. All rights reserved.
//

#import "NSString+YXG_Universal.h"

@implementation NSString (YXG_Universal)

- (NSString *)replaceNull:(NSString *)string {
    if (!string || string.length == 0) {
        return @"";
    }
    return string;
}
@end