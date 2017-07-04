//
//  YFMainAPIClient.m
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFMainAPIClient.h"

@implementation YFMainAPIClient
+ (YFMainAPIClient *)shardInstance
{
    static YFMainAPIClient *shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[YFMainAPIClient alloc] init];
    });

    return shareInstance;
}

#pragma mark - public
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"HOST"]];
        //设置请求队列
        self.requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.requestManager.requestSerializer.timeoutInterval = kAPITimeOut;
        //设置响应队列
        self.requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", @"text/json", @"application/json", @"application/vnd.apple.pkpass", nil]];
        //设置Header
        [self.requestManager.requestSerializer setValue:@"Value" forHTTPHeaderField:@"CustomKey"];

    }
    return self;
}

- (id)get:(NSString *)URLString
parameters:(NSDictionary *)parameters
  success:(APISuccessBlock)success
   notice:(APINoticeBlock)notice
  failure:(APIFailureBlock)failure
{
    YFAPIClientConfigure *configure = [YFAPIClientConfigure configurer];
    configure.urlString = URLString;
    configure.parameters = parameters;
    configure.requestHttpMethod =YFAPIRequestGET;
    return [self requestClientConfigure:configure success:success notice:notice failure:failure];
}

- (id)post:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(APISuccessBlock)success
    notice:(APINoticeBlock)notice
   failure:(APIFailureBlock)failure
{
    YFAPIClientConfigure *configure = [YFAPIClientConfigure configurer];
    configure.urlString = URLString;
    configure.parameters = parameters;
    configure.requestHttpMethod =YFAPIRequestPOST;
    return [self requestClientConfigure:configure success:success notice:notice failure:failure];
}

-  (id)put:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(APISuccessBlock)success
    notice:(APINoticeBlock)notice
   failure:(APIFailureBlock)failure
{
    YFAPIClientConfigure *configure = [YFAPIClientConfigure configurer];
    configure.urlString = URLString;
    configure.parameters = parameters;
    configure.requestHttpMethod =YFAPIRequestPUT;
    return [self requestClientConfigure:configure success:success notice:notice failure:failure];
}

- (id)deleteMethod:(NSString *)URLString
        parameters:(NSDictionary *)parameters
           success:(APISuccessBlock)success
            notice:(APINoticeBlock)notice
           failure:(APIFailureBlock)failure
{
    YFAPIClientConfigure *configure = [YFAPIClientConfigure configurer];
    configure.urlString = URLString;
    configure.parameters = parameters;
    configure.requestHttpMethod =YFAPIRequestDELETE;
    return [self requestClientConfigure:configure success:success notice:notice failure:failure];
}

#pragma mark - 返回数据处理
//根据业务逻辑处理成功返回的数据。
- (void)processSuccessTask:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(APISuccessBlock)success
                    notice:(APINoticeBlock)notice
                   failure:(APIFailureBlock)failure
{
    /*
    NSInteger code = [[responseObject objectForKey:@"CODE"] integerValue];
    if (code == 0) {
        !success?:success(task,responseObject);
    }
    else{
        if (code == 'NO LOGIN') {
            //弹出登陆
        }else if (notice) {
            notice(task, responseObject);
        } else if (failure) {
            failure(task, nil);
        }
    }
     */

}
//根据业务逻辑处理请求失败返回的数据。
- (void)processFailureTask:(NSURLSessionDataTask *)task
                     error:(NSError *)error
                    notice:(APINoticeBlock)notice
                   failure:(APIFailureBlock)failure
{
    /*
    //要在400 500系列错误中提取错误code和mssage；
    NSHTTPURLResponse *response = error.userInfo[@"com.alamofire.serialization.response.error.response"];
    if (response.statusCode/100 == 4 || response.statusCode/100 == 5 ) {
        NSData *msgData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        
        NSDictionary *msgDic = [NSJSONSerialization JSONObjectWithData:msgData options:NSJSONReadingMutableContainers error:nil];
        
        if (msgDic.count) {
            !notice?:notice(task,msgDic);
        }
        else{
            !failure?:failure(task,error);
        }
    }
    else{
        !failure?:failure(task,error);
    }
     */

}

#pragma mark - 请求参数处理
- (NSDictionary *)__finalParametersWithParams:(NSDictionary *)params
{
    return params;
}
@end
