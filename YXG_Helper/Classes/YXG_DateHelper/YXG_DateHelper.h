//
//  YXG_DateHelper.h
//  YXG_Helper
//
//  Created by  on 2019/1/10.
//  Copyright © 2019 everfine. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXG_DateHelper : NSObject
/**
 获取当前时间的毫秒级时间戳
 @return 时间戳
 */
+ (UInt64)YXG_getCurrentMilliseTimestamp;
@end

NS_ASSUME_NONNULL_END
