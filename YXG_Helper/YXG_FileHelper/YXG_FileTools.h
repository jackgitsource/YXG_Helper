//
//  YXG_FileTools.h
//  SPIC-120
//
//  Created by  on 2019/1/3.
//  Copyright © 2019 everfine. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FileManager [NSFileManager defaultManager]

NS_ASSUME_NONNULL_BEGIN

@interface YXG_FileTools : NSObject

/** 创建文件夹路径(document目录下)*/
+ (NSString *)pathByDirectoryName:(NSString *)directoryName;
/** 创建文件路径(document目录下)*/
+ (NSString *)pathByFileName:(NSString *)fileName path:(NSString *)path;

/** 存储txt文件(document目录下)*/
+ (void)saveTxtByFileName:(NSString *)fileName directoryName:(NSString *)directoryName string:(NSString *)string callback:(void(^)(NSString *path))callback;
@end

NS_ASSUME_NONNULL_END
