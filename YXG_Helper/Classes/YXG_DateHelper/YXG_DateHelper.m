//
//  YXG_DateHelper.m
//  YXG_Helper
//
//  Created by  on 2019/1/10.
//

#import "YXG_DateHelper.h"

@implementation YXG_DateHelper

/**
 获取当前时间的毫秒级时间戳
 @return 时间戳
 */
+ (UInt64)YXG_getCurrentMilliseTimestamp {
    return [[NSDate date] timeIntervalSince1970]*1000;// 精确到毫秒
}
@end
