//
//  YFBaseAPIClient.h
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "YFAPIClientConfigure.h"

#define kAPITimeOut 60
typedef void (^APISuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^APINoticeBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^APIFailureBlock)(NSURLSessionDataTask *task, NSError *error);

/**
    数据请求基类，不可直接调用，需要子类化
    子类化可以更好的扩展和兼容，建议以 新老API接口、不在同一个服务器的
 */
@interface YFBaseAPIClient : NSObject
/* 请求绘画manager。由具体逻辑子类实现 */
@property (nonatomic, strong) AFHTTPSessionManager *requestManager;

/**
 统一请求入口。

 @param apiClientConfigure 请求配置，包含url、参数、请求类型等
 @param success 正常返回数据
 @param notice 业务逻辑错误数据
 @param failure 网络错误数据
 @return 请求对象task
 */
-(id)requestClientConfigure:(YFAPIClientConfigure *)apiClientConfigure
                    success:(APISuccessBlock)success
                     notice:(APINoticeBlock)notice
                    failure:(APIFailureBlock)failure;


/**
 取消所有请求
 */
-(void)cancelAllRequests;

#pragma mark - 子类可能重写方法
/**
 根据业务逻辑处理成功返回的数据。将成功请求回来的数据，更具code分成success和notice
 不同子类自己重写实现，，默认直接调用success处理。
 */
- (void)processSuccessTask:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(APISuccessBlock)success
                    notice:(APINoticeBlock)notice
                   failure:(APIFailureBlock)failure;
/**
 根据业务逻辑处理请求失败返回的数据。有些后端将业务逻辑错误用httpcode 400、500系列返回。我们要区分
 不同子类自己重写实现，，默认直接调用failure处理。
  */
- (void)processFailureTask:(NSURLSessionDataTask *)task
                     error:(NSError *)error
                    notice:(APINoticeBlock)notice
                   failure:(APIFailureBlock)failure;

/**
 对请求参数做处理。依照自己和后端的约定，添加通用参数（时间戳、ID、设备ID、渠道号等）、对参数做签名等。
 不同子类自己重写实现，默认返回原始参数。

 @param params 原始参数
 @return 处理过的参数
 */
- (NSDictionary *)__finalParametersWithParams:(NSDictionary *)params;
@end
