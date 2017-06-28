//
//  OpenShare+YFLogin.h
//  WeiXinMovie
//
//  Created by YF on 2017/1/5.
//  Copyright © 2017年 YF. All rights reserved.
//  OpenShare 登陆获取用户信息扩展。

// TODO :网络请求需要修改成系统的或者当前项目用的

#import <OpenShare/OpenShare.h>
@class OSUserInfo;

typedef NS_ENUM(NSUInteger, YFUserLoginType) {
    YFUserLoginTypeQQ,
    YFUserLoginTypeWeixin,
    YFUserLoginTypeWeibo,
};


typedef void (^OSLoginSuccess)(OSUserInfo * userInfo);
typedef void (^OSLoginFail)(NSDictionary * message,NSError *error);


@interface OpenShare (YFLogin)
+(void)WeixinLoginSuccess:(OSLoginSuccess)success Fail:(OSLoginFail)fail;
+(void)WeiboLoginSuccess:(OSLoginSuccess)success Fail:(OSLoginFail)fail;
+(void)QQLoginSuccess:(OSLoginSuccess)success Fail:(OSLoginFail)fail;
@end




@interface OSUserInfo : NSObject

@property (assign, nonatomic) YFUserLoginType loginType;
@property (strong, nonatomic) NSString* nickName;
@property (strong, nonatomic) NSString* icon;
@property (strong, nonatomic) NSString* token;
@property (strong, nonatomic) NSString* openid;
@property (strong, nonatomic) NSString* unionid;
@property (nonatomic, strong) NSDictionary *rawData;

-(instancetype)initWithLoginType:(YFUserLoginType)loginType;
@end
