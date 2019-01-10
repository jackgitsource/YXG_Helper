//
//  YXG_FileTools.h
//  SPIC-120
//
//  Created by  on 2019/1/3.
//  Copyright © 2019 everfine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define FileManager [NSFileManager defaultManager]

NS_ASSUME_NONNULL_BEGIN

@interface YXG_FileTools : NSObject

/**
 创建文件夹路径
 (document目录下)
 @param directoryName 文件夹名称
 @return 文件夹路径
 */
+ (NSString *)pathByDirectoryName:(NSString *)directoryName;
    
/**
 创建文件路径
 (document目录下)
 @param fileName 文件名
 @param path 创建文件路径
 @return 文件路径
 */
+ (NSString *)pathByFileName:(NSString *)fileName path:(NSString *)path;

/**
 存储txt文件
 (document目录下)
 @param fileName 如123.jpg
 @param directoryName 上级文件夹名
 @param string 内容
 @param callback 回调
 */
+ (void)saveTxtByFileName:(NSString *)fileName directoryName:(NSString *)directoryName string:(NSString *)string callback:(void(^)(NSString *path))callback;

/**
 获取默认的缓存路径
 @return 路径
 */
+ (NSString *)defultCacheFilePath;

/**
 存储图片到默认路径下
 @param image 图片
 @param imageName 图片名
 @param callback 回调
 */
+ (void)saveImage:(UIImage *)image imageName:(NSString *)imageName callback:(void(^)(NSString *path))callback;
    
/**
 */
@end

NS_ASSUME_NONNULL_END
