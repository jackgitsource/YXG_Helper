//
//  YXG_DateHelper.m
//  YXG_Helper
//
//  Created by  on 2019/1/10.
//

#import "YXG_DateHelper.h"

@implementation YXG_DateHelper

+ (UInt64)yxg_getCurrentMilliseTimestamp {
    return [[NSDate date] timeIntervalSince1970]*1000;// 精确到毫秒
}

+ (NSString *)yxg_CurrentDateString {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    return [dateformatter stringFromDate:date];
}

+ (NSString *)yxg_TimestampConversionToDateString:(UInt64)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    return [formatter stringFromDate:date];
}
@end
