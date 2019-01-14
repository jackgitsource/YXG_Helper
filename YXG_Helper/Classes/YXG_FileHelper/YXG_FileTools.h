//
//  YXG_FileTools.h
//  SPIC-120
//
//  Created by  on 2019/1/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define FileManager [NSFileManager defaultManager]

NS_ASSUME_NONNULL_BEGIN

@interface YXG_FileTools : NSObject

/**
 获取默认的缓存路径
 @return 路径
 */
+ (NSString *)defultCacheFilePath;
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
 在给定路径下新建一个文件夹
 @param path 给定目录
 @param folderName 文件夹
 @return 路径
 */
+ (NSString *)pathByPath:(NSString *)path newFolderName:(NSString *)folderName;
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
 存储图片到默认路径下
 @param image 图片
 @param imageName 图片名
 @param callback 回调
 */
+ (void)saveImage:(UIImage *)image imageName:(NSString *)imageName callback:(void(^)(NSString *path))callback;
/**
 存储图片到路径
 @param image 图片
 @param filePath 路径
 @param callback 回调
*/
+ (void)saveImage:(UIImage *)image filePath:(NSString *)filePath callback:(void(^)(NSString *path))callback;
/**
 从默认路径下读取图片
 @param imageName 图片名
 @param callback 回调
 */
+ (void)readImageWithImageName:(NSString *)imageName callback:(void(^)(UIImage *))callback;
/**
 读取图片
 @param path 图片路径
 @param callback 回调
 */
+ (void)readImageWithPath:(NSString *)path callback:(void(^)(UIImage *))callback;
/**
 存储文件到默认路径下
 @param fileName 文件名
 @param data 文件
 @param callback 回调
 */
- (void)saveFileName:(NSString *)fileName data:(NSData *)data callback:(void(^)(NSString *))callback;
/**
 存储文件到路径
 @param path 路径
 @param data 文件
 @param callback 回调
 */
+ (void)saveToPath:(NSString *)path data:(NSData *)data callback:(void(^)(NSString *path))callback;
/**
 默认路径下读取文件
 @param fileName 文件名
 @param callback 回调
 */
+ (void)readFileWIthFileName:(NSString *)fileName callback:(void(^)(NSData *))callback;
/**
 路径下读取文件
 @param path 路径
 @param callback 回调
 */
+ (void)readFileWIthPath:(NSString *)path callback:(void(^)(NSData *))callback;

@end

NS_ASSUME_NONNULL_END
