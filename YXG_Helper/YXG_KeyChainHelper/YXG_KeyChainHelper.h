//
//  YXG_KeyChainHelper.h
//  SPIC-120
//
//  Created by  on 2019/1/9.
//  Copyright © 2019 everfine. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YXG_UUID [YXG_KeyChainHelper YXG_uuid]
NS_ASSUME_NONNULL_BEGIN

@interface YXG_KeyChainHelper : NSObject

/**
 储存字符串到🔑钥匙串
 @param aValue 对应的Value
 @param aKey   对应的Key
 */
+ (void)YXG_saveKeychainValue:(NSString *)aValue key:(NSString *)aKey;


/**
 从🔑钥匙串获取字符串
 @param aKey 对应的Key
 @return 返回储存的Value
 */
+ (NSString *)YXG_readValueWithKeychain:(NSString *)aKey;


/**
 从🔑钥匙串删除字符串
 @param aKey 对应的Key
 */
+ (void)YXG_deleteKeychainValue:(NSString *)aKey;

+ (NSString *)YXG_uuid;

@end

NS_ASSUME_NONNULL_END