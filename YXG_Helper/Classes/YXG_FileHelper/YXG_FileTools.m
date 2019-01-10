//
//  YXG_FileTools.m
//  SPIC-120
//
//  Created by  on 2019/1/3.
//  Copyright © 2019 everfine. All rights reserved.
//

#import "YXG_FileTools.h"
#import "YXG_Macro.h"

@implementation YXG_FileTools
    
+ (NSString *)pathByDirectoryName:(NSString *)directoryName {
    NSString *basePath = [[self documentPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",directoryName]];
    if ([self creatDirectory:basePath]) {
        return basePath;
    }
    return @"";
}
    
+ (BOOL)creatDirectory:(NSString *)basePath {
    BOOL result = YES;
    BOOL isDirectory = NO;
    if (![FileManager fileExistsAtPath:basePath isDirectory:&isDirectory]) {
        if (!isDirectory) {
            @try {
                result = [FileManager createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:nil error:nil];
            } @catch (NSException *exception) {
                NSLog(@"路径创建失败: %@",exception);
                result = NO;
            } @finally {
            }
        }
    }
    return result;
}
    
+ (NSString *)pathByFileName:(NSString *)fileName path:(NSString *)path {
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    BOOL isDirectory = NO;
    if (![FileManager fileExistsAtPath:filePath isDirectory:&isDirectory]) {
        if (isDirectory) {
            @try {
                [FileManager createFileAtPath:filePath contents:nil attributes:nil];
            } @catch (NSException *exception) {
                NSLog(@"文件创建失败: %@",exception);
            } @finally {
                
            }
        }
    }
    return filePath;
}
    
+ (void)saveTxtToPath:(NSString *)path string:(NSString *)string callback:(void(^)(NSString *path))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @try {
            BOOL result = [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
            if (result) {
                callback(path);
            }
        } @catch (NSException *exception) {
            NSLog(@"txt文件写入失败: %@",exception);
        } @finally {
        }
    });
}
    
+ (void)saveTxtByFileName:(NSString *)fileName directoryName:(NSString *)directoryName string:(NSString *)string callback:(void(^)(NSString *path))callback {
    NSString *directoryPath = [self pathByDirectoryName:directoryName];
    NSString *filePath = [self pathByFileName:fileName path:directoryPath];
    [self saveTxtToPath:filePath string:string callback:callback];
}
    
    
+ (NSString *)defultCacheFilePath {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *basePath = [cachePath stringByAppendingPathComponent:YXG_BundleIdentifier];
    if ([YXG_FileTools creatDirectory:basePath]) {
        return basePath;
    }
    return @"";
}
    
+ (void)saveToPath:(NSString *)path data:(NSData *)data callback:(void(^)(NSString *path))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @try {
            BOOL result = [data writeToFile:path atomically:YES];
            if (result) {
                if (callback) callback(path);
            }
        } @catch (NSException *exception) {
            NSLog(@"文件写入失败");
        } @finally {
        }
    });
}
    
- (void)saveFileName:(NSString *)fileName data:(NSData *)data callback:(void(^)(NSString *))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *path = [YXG_FileTools pathByFileName:fileName path:[YXG_FileTools defultCacheFilePath]];
        [YXG_FileTools saveToPath:path data:data callback:callback];
    });
}

+ (void)readFileWIthFileName:(NSString *)fileName callback:(void(^)(NSData *))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *filePath = [YXG_FileTools pathByFileName:fileName path:[YXG_FileTools defultCacheFilePath]];
        [YXG_FileTools readFileWIthPath:filePath callback:callback];
    });
}

+ (void)readFileWIthPath:(NSString *)path callback:(void(^)(NSData *))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfFile:path];
        if (callback) callback(data);
    });
}

    
+ (void)saveImage:(UIImage *)image imageName:(NSString *)imageName callback:(void(^)(NSString *path))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 创建图片路径
        NSString *path = [YXG_FileTools pathByFileName:imageName path:[YXG_FileTools defultCacheFilePath]];
        // 图片转换成NSDate存储
        NSData *data = UIImageJPEGRepresentation(image, 0.95);
        [YXG_FileTools saveToPath:path data:data callback:callback];
    });
}
    
+ (void)saveImage:(UIImage *)image filePath:(NSString *)filePath callback:(void(^)(NSString *path))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = UIImageJPEGRepresentation(image, 0.95);
        [YXG_FileTools saveToPath:filePath data:data callback:callback];
    });
}

+ (void)readImageWithImageName:(NSString *)imageName callback:(void(^)(UIImage *))callback {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *path = [YXG_FileTools pathByFileName:imageName path:[YXG_FileTools defultCacheFilePath]];
        [YXG_FileTools readImageWithPath:path callback:callback];
    });
}

+ (void)readImageWithPath:(NSString *)path callback:(void(^)(UIImage *))callback {
    [self readFileWIthPath:path callback:^(NSData * data) {
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if(callback) callback(image);
        });
    }];
}
    
+ (NSString *)documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}
@end

