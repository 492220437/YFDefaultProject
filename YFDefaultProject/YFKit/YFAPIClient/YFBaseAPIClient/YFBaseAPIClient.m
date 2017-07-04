//
//  YFBaseAPIClient.m
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFBaseAPIClient.h"

@implementation YFBaseAPIClient

-(id)requestClientConfigure:(YFAPIClientConfigure *)apiClientConfigure
                    success:(APISuccessBlock)success
                     notice:(APINoticeBlock)notice
                    failure:(APIFailureBlock)failure{
    switch (apiClientConfigure.requestHttpMethod) {
        case YFAPIRequestGET:
            return [self GET:apiClientConfigure.urlString parameters:apiClientConfigure.parameters success:success notice:notice failure:failure];
            break;
        case YFAPIRequestPOST:
            return [self POST:apiClientConfigure.urlString parameters:apiClientConfigure.parameters success:success notice:notice failure:failure];
            break;
        case YFAPIRequestDELETE:
            return [self DELETE:apiClientConfigure.urlString parameters:apiClientConfigure.parameters success:success notice:notice failure:failure];
            
            break;
        case YFAPIRequestPUT:
            return [self PUT:apiClientConfigure.urlString parameters:apiClientConfigure.parameters success:success notice:notice failure:failure];
            break;

        default:
            break;
    }
    return nil;
    
}
- (void)cancelAllRequests{
    [self.requestManager.operationQueue cancelAllOperations];
}


#pragma mark - private
#pragma mark - 请求分发
- (id)GET:(NSString *)URLString
parameters:(NSDictionary *)parameters
  success:(APISuccessBlock)success
   notice:(APINoticeBlock)notice
  failure:(APIFailureBlock)failure
{
    return [self.requestManager GET:URLString
                         parameters:[self __finalParametersWithParams:parameters]
                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                [self processSuccessTask:task
                                          responseObject:responseObject
                                                 success:success
                                                  notice:notice
                                                 failure:failure];
                            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                [self processFailureTask:task
                                                   error:error
                                                  notice:notice
                                                 failure:failure];
                            }];
}

- (id)POST:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(APISuccessBlock)success
    notice:(APINoticeBlock)notice
   failure:(APIFailureBlock)failure
{
    return [self.requestManager POST:URLString
                          parameters:[self __finalParametersWithParams:parameters]
                             success:^(NSURLSessionDataTask *task, id responseObject) {
                                 [self processSuccessTask:task
                                           responseObject:responseObject
                                                  success:success
                                                   notice:notice
                                                  failure:failure];
                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                 [self processFailureTask:task
                                                    error:error
                                                   notice:notice
                                                  failure:failure];
                             }];
    
}

- (id)PUT:(NSString *)URLString
parameters:(NSDictionary *)parameters
  success:(APISuccessBlock)success
   notice:(APINoticeBlock)notice
  failure:(APIFailureBlock)failure
{
    return [self.requestManager PUT:URLString
                         parameters:[self __finalParametersWithParams:parameters]
                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                [self processSuccessTask:task
                                          responseObject:responseObject
                                                 success:success
                                                  notice:notice
                                                 failure:failure];
                            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                [self processFailureTask:task
                                                   error:error
                                                  notice:notice
                                                 failure:failure];
                            }];
}

- (id)DELETE:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(APISuccessBlock)success
      notice:(APINoticeBlock)notice
     failure:(APIFailureBlock)failure
{
    return  [self.requestManager DELETE:URLString
                             parameters:[self __finalParametersWithParams:parameters]
                                success:^(NSURLSessionDataTask *task, id responseObject) {
                                    [self processSuccessTask:task
                                              responseObject:responseObject
                                                     success:success
                                                      notice:notice
                                                     failure:failure];
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    [self processFailureTask:task
                                                       error:error
                                                      notice:notice
                                                     failure:failure];
                                }];
}

#pragma mark - 返回数据处理
//根据业务逻辑处理成功返回的数据。
- (void)processSuccessTask:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(APISuccessBlock)success
                    notice:(APINoticeBlock)notice
                   failure:(APIFailureBlock)failure
{
    if (success) {
        success(task,responseObject);
    }
}
//根据业务逻辑处理请求失败返回的数据。
- (void)processFailureTask:(NSURLSessionDataTask *)task
                     error:(NSError *)error
                    notice:(APINoticeBlock)notice
                   failure:(APIFailureBlock)failure
{
    if (failure) {
        failure(task,error);
    }
}

#pragma mark - 请求参数处理
- (NSDictionary *)__finalParametersWithParams:(NSDictionary *)params
{
    return params;
}
@end
