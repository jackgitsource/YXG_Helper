//
//  YXG_FileTools.m
//  SPIC-120
//
//  Created by  on 2019/1/3.
//  Copyright © 2019 everfine. All rights reserved.
//

#import "YXG_FileTools.h"

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

+ (NSString *)documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

@end
