//
//  HTTPManager.m
//  Frodo-HTTP_Example
//
//  Created by 陈林 on 2018/3/20.
//  Copyright © 2018年 chenlinios@sina.com. All rights reserved.
//

#import "HTTPManager.h"
#import "AFNetworking.h"

@implementation HTTPManager

+ (void)getRequestWithURL:(NSString *)url
                   params:(NSDictionary *)params
                 progress:(void (^)(NSProgress *progress))progress
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure
{
    NSError *error = nil;
    //判断接口是否是空值
    if (url.length == 0 || [url isEqualToString:@""]) {
        failure(error);
    }
    
    //开始请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //内容类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)postRequestWithURL:(NSString *)url
                   params:(NSDictionary *)params
                 progress:(void (^)(NSProgress *))postProgress
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        postProgress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)requestWithMethod:(HTTPRequestType)requestType
                     url:(NSString *)url
                  params:(id)params
                progress:(void (^)(NSProgress * _Nonnull))progress
                 success:(void (^)(id _Nonnull))success
                 failure:(void (^)(NSError * _Nonnull))failure
{
    switch (requestType) {
            case GET:
            [HTTPManager getRequestWithURL:url params:params progress:progress success:success failure:failure];
            break;
            case POST:
            [HTTPManager postRequestWithURL:url params:params progress:progress success:success failure:failure];
            
        default:
            break;
    }
}

+(void)uploadWithImage:(UIImage *)image
                   url:(NSString *)url
              fileName:(NSString *)fileName
                  name:(NSString *)name
              mimeType:(NSString *)mimeType
            parameters:(NSDictionary *)parameters
              progress:(void (^)(NSProgress * _Nullable))progress
               success:(void (^)(id _Nonnull))success
               failure:(void (^)(NSError * _Nonnull))failure {
    NSData *imgData = UIImageJPEGRepresentation(image, 0.001);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    //参数
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传文件
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName =   [NSString stringWithFormat:@"%@.jpg", str];
        [formData appendPartWithFileData:imgData name:@"photo" fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+(void)cancelAllRequest {
    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
}

+(void)AFNetWorkStatus  {
    //1.创建网络监测者
    AFNetworkReachabilityManager *reachManager = [AFNetworkReachabilityManager sharedManager];
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    [reachManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
                case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI网络");
                break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
            default:
                break;
        }
    }];
    [reachManager startMonitoring];
    
}

@end
