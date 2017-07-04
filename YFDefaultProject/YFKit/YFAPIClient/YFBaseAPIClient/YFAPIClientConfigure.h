//
//  YFAPIClientConfigure.h
//  YFDefaultProject
//
//  Created by YF on 2017/7/3.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, YFAPIRequestHttpMethod)
{
    YFAPIRequestGET = 0,
    YFAPIRequestPOST = 1 << 0,
    YFAPIRequestDELETE = 1 << 1,
    YFAPIRequestPUT = 1 << 2,
};
@interface YFAPIClientConfigure : NSObject

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, assign) YFAPIRequestHttpMethod requestHttpMethod;
/**
 返回一个配置实例.
 */
+ (instancetype)configurer;

@end
