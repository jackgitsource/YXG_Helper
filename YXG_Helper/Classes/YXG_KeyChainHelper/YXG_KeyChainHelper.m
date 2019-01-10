//
//  YXG_KeyChainHelper.m
//  SPIC-120
//
//  Created by  on 2019/1/9.
//

#import "YXG_KeyChainHelper.h"
#import <UIKit/UIKit.h>

@implementation YXG_KeyChainHelper

+ (NSMutableDictionary *)YXG_getKeychainQuery:(NSString *)service{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,
            (__bridge_transfer id)kSecClass,service,
            (__bridge_transfer id)kSecAttrService,service,
            (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,
            (__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)YXG_saveKeychainValue:(NSString *)aValue key:(NSString *)aKey{
    if (!aKey) {
        return ;
    }
    if(!aValue) {
        aValue = @"";
    }
    NSMutableDictionary * keychainQuery = [self YXG_getKeychainQuery:aKey];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:aValue] forKey:(__bridge_transfer id)kSecValueData];
    
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
    if (keychainQuery) {
        CFRelease((__bridge CFTypeRef)(keychainQuery));
    }
}

+ (NSString *)YXG_readValueWithKeychain:(NSString *)aKey
{
    NSString *ret = nil;
    NSMutableDictionary *keychainQuery = [self YXG_getKeychainQuery:aKey];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = (NSString *)[NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", aKey, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)YXG_deleteKeychainValue:(NSString *)aKey {
    NSMutableDictionary *keychainQuery = [self YXG_getKeychainQuery:aKey];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}

+ (NSString *)YXG_uuid {
    NSString *deviceId = [YXG_KeyChainHelper YXG_readValueWithKeychain:@"Key_DeviceUUIDString"];
    if (!deviceId || !deviceId.length) {
        deviceId = [[UIDevice currentDevice].identifierForVendor UUIDString];
        [YXG_KeyChainHelper YXG_saveKeychainValue:deviceId key:@"Key_DeviceUUIDString"];
    }
    return deviceId;
}

@end
