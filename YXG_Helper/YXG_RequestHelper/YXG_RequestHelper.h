//
//  YXG_RequestHelper.h
//  YXG_Helper
//
//  Created by  on 2019/1/11.
//  Copyright © 2019 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 域名or ipf地址
#define YXG_Http_server @"192.168.10.10"
// 端口号一般不需要加都是默认的
#define YXG_Http_port 8080
// 文件夹
#define YXG_Base_Url @"/auth/"
// 地址
#define YXG_Host_Name [NSString stringWithFormat:@"http://%@:%d",Http_server,YXG_Http_port]
// auth
#define YXG_BaseAuthUrl [NSString stringWithFormat:@"%@%@",YXG_Host_Name,YXG_Base_Url]

/**
 请求成功回调
 @param dictionary 响应数据
 @param error 错误信息
 */
typedef void(^HttpsDictionaryComplentionCallback)(NSDictionary *dictionary,NSString *error);

NS_ASSUME_NONNULL_BEGIN

@interface YXG_RequestHelper : NSObject

@end
/**
 if (callback) {
 // 请求参数
 NSMutableDictionary *baseParameters = [self baseParametes];
 [baseParameters setObject:sn forKey:@"sn"];
 [baseParameters setObject:softname forKey:@"softname"];
 [baseParameters setObject:machinecode forKey:@"machinecode"];
 
 // 网络加载标志
 [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
 
 // AF
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 manager.responseSerializer = [AFJSONResponseSerializer serializer];
 manager.requestSerializer = [AFJSONRequestSerializer serializer];
 manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html; charset=utf-8",@"application/json", @"text/json", @"text/javascript",@"text/plain; charset=utf-8",nil];
 manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
 [manager POST:[NSString stringWithFormat:@"%@%@",BaseAuthUrl,url]
 parameters:baseParameters
 progress:nil
 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
 NSLog(@"responseObject:%@",responseObject);
 }
 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
 NSLog(@"❌error %@",error.localizedDescription);
 }];
 }
 */
NS_ASSUME_NONNULL_END
