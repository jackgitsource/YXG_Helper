//
//  YXG_KeyChainHelper.h
//  SPIC-120
//
//  Created by  on 2019/1/9.
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
+ (void)yxg_saveKeychainValue:(NSString *)aValue key:(NSString *)aKey;


/**
 从🔑钥匙串获取字符串
 @param aKey 对应的Key
 @return 返回储存的Value
 */
+ (NSString *)yxg_readValueWithKeychain:(NSString *)aKey;


/**
 从🔑钥匙串删除字符串
 @param aKey 对应的Key
 */
+ (void)yxg_deleteKeychainValue:(NSString *)aKey;

+ (NSString *)yxg_uuid;

@end

NS_ASSUME_NONNULL_END
