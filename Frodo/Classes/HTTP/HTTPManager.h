//
//  HTTPManager.h
//  Frodo-HTTP_Example
//
//  Created by 陈林 on 2018/3/20.
//  Copyright © 2018年 chenlinios@sina.com. All rights reserved.
//

#import <Foundation/Foundation.h>




typedef NS_ENUM(NSInteger, HTTPRequestType) {
    GET          = 1,  //GET请求
    POST         = 2,  //POST请求
};


@interface HTTPManager : NSObject



+(void)requestWithMethod:(HTTPRequestType)requestType
                     url:(nonnull NSString *)url
                  params:(nonnull id)params
                progress:(nullable void(^)(NSProgress * _Nonnull progress))progress
                 success:(nullable void(^)(id _Nonnull responseObject))success
                 failure:(nullable void(^)(NSError * _Nonnull error))failure;


/**
 取消所有网络请求
 */
+(void)cancelAllRequest;


/**
 监听网络状态
 */
+(void)AFNetWorkStatus;


+(void)uploadWithImage:(UIImage *_Nullable)image
                   url:(NSString *_Nonnull)url
              fileName:(NSString *_Nullable)fileName
                  name:(NSString *_Nonnull)name
              mimeType:(NSString *_Nonnull)mimeType
            parameters:(NSDictionary *_Nonnull)parameters
              progress:(nullable void(^)(NSProgress *  _Nullable progress))progress
               success:(nullable void(^)(id _Nonnull responseObject))success
               failure:(nullable void(^)(NSError * _Nonnull error))failure;


@end
