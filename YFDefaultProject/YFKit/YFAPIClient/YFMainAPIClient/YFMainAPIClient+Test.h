//
//  YFMainAPIClient+Test.h
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFMainAPIClient.h"

@interface YFMainAPIClient (Test)
- (id)getTestInfoWithSuccess:(APISuccessBlock)success
                      notice:(APINoticeBlock)notice
                     failure:(APIFailureBlock)failure;

- (id)postTestInfoWithParama1:(NSString *)parama1
                      success:(APISuccessBlock)success
                       notice:(APINoticeBlock)notice
                      failure:(APIFailureBlock)failure;
@end
