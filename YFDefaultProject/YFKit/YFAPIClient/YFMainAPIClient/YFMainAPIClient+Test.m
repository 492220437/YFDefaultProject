//
//  YFMainAPIClient+Test.m
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFMainAPIClient+Test.h"

@implementation YFMainAPIClient (Test)
- (id)getTestInfoWithSuccess:(APISuccessBlock)success
                      notice:(APINoticeBlock)notice
                     failure:(APIFailureBlock)failure
{
    return [self get:@"/test"
          parameters:nil
             success:success
              notice:notice
             failure:failure];
}

- (id)postTestInfoWithParama1:(NSString *)parama1
                      success:(APISuccessBlock)success
                       notice:(APINoticeBlock)notice
                      failure:(APIFailureBlock)failure
{
    NSMutableDictionary *params = @{}.mutableCopy;
    [params setValue:@"parama1" forKey:@"parama1"];
    
    return [self post:@"/test"
          parameters:params
             success:success
              notice:notice
             failure:failure];
}
@end
