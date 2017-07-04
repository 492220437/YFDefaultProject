//
//  YFMainAPIClient.h
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFBaseAPIClient.h"

@interface YFMainAPIClient : YFBaseAPIClient
+ (YFMainAPIClient*)shardInstance;

- (id)get:(NSString *)URLString
parameters:(NSDictionary *)parameters
  success:(APISuccessBlock)success
   notice:(APINoticeBlock)notice
  failure:(APIFailureBlock)failure;

- (id)post:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(APISuccessBlock)success
    notice:(APINoticeBlock)notice
   failure:(APIFailureBlock)failure;

- (id)deleteMethod:(NSString *)URLString
        parameters:(NSDictionary *)parameters
           success:(APISuccessBlock)success
            notice:(APINoticeBlock)notice
           failure:(APIFailureBlock)failure;

- (id)put:(NSString *)URLString
parameters:(NSDictionary*)parameters
  success:(APISuccessBlock)success
   notice:(APINoticeBlock)notice
  failure:(APIFailureBlock)failure;

@end
