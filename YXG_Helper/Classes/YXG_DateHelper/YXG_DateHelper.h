//
//  YXG_DateHelper.h
//  YXG_Helper
//
//  Created by  on 2019/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXG_DateHelper : NSObject
/**
 获取当前时间的毫秒级时间戳
 @return 时间戳
 */
+ (UInt64)yxg_getCurrentMilliseTimestamp;
/**
 获取当前时间 yyyy-MM-dd hh:mm:ss
 @return 时间字符串
 */
+ (NSString *)yxg_CurrentDateString;
/**
 时间戳转换成字符串
 @param timestamp 时间戳
 @return 时间字符
 */
+ (NSString *)yxg_TimestampConversionToDateString:(UInt64)timestamp;
@end

NS_ASSUME_NONNULL_END
