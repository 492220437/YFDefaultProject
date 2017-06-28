//
//  OpenShare+YFLogin.m
//  WeiXinMovie
//
//  Created by YF on 2017/1/5.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "OpenShare+YFLogin.h"
#import "OpenShare+Weixin.h"
#import "OpenShare+Weibo.h"
#import "OpenShare+QQ.h"
//#import "WPAPIClient.h"

#define OS_LOGIN_WX_URL1 @"https://api.weixin.qq.com/sns/oauth2/access_token"
#define OS_LOGIN_WX_URL2 @"https://api.weixin.qq.com/sns/userinfo"
#define OS_LOGIN_WB_URL @"https://api.weibo.com/2/users/show.json"
#define OS_LOGIN_QQ_URL @"https://graph.qq.com/user/get_user_info"

static OSLoginSuccess loginSuccessCallback;
static OSLoginFail loginFailCallback;
static OSUserInfo *userInfo;

@implementation OpenShare (YFLogin)
+(void)WeixinLoginSuccess:(OSLoginSuccess)success Fail:(OSLoginFail)fail
{
    loginSuccessCallback = success;
    loginFailCallback = fail;
    userInfo = [[OSUserInfo alloc]initWithLoginType:YFUserLoginTypeWeixin];
    
    [OpenShare WeixinAuth:@"snsapi_userinfo" Success:^(NSDictionary *message) {
        NSLog(@"微信登录成功:\n%@",message);
        NSString *code = [message valueForKey:@"code"];
        NSDictionary *tokenParameters = @{@"appid":@"WEIXIN_PAY_APPID",@"secret":@"WEIXIN_PAY_APPSECRET",@"code":code,@"grant_type":@"authorization_code"};
//        [[WPAPIClient shardInstance] otherGet:OS_LOGIN_WX_URL1
//                                   parameters:tokenParameters
//                                      success:^(NSURLSessionDataTask *task, id responseObject) {
//                                          NSString *access_token = [responseObject valueForKey:@"access_token"];
//                                          NSString *openid = [responseObject valueForKey:@"openid"];
//                                          NSDictionary *infoParameters = @{@"access_token":access_token,@"openid":openid};
//                                          
//                                          userInfo.token = access_token;
//                                          userInfo.openid = openid;
//                                          [[WPAPIClient shardInstance] otherGet:OS_LOGIN_WX_URL2
//                                                                     parameters:infoParameters
//                                                                        success:^(NSURLSessionDataTask *task, id responseObject) {
//                                                                            if (userInfo.loginType == WPUserLoginTypeWeixin) {
//                                                                                userInfo.rawData = responseObject;
//                                                                                !success?:success(userInfo);
//                                                                            }
//                                                                        } failure:nil enableJsonRequest:NO];
//                                          
//                                      } failure:nil enableJsonRequest:YES];
        
        
    } Fail:^(NSDictionary *message, NSError *error) {
        !fail?:fail(message,error);
    }];

}

+(void)WeiboLoginSuccess:(OSLoginSuccess)success Fail:(OSLoginFail)fail
{
    loginSuccessCallback = success;
    loginFailCallback = fail;
    userInfo = [[OSUserInfo alloc]initWithLoginType:YFUserLoginTypeWeibo];
    
    [OpenShare WeiboAuth:@"all" redirectURI:@"SINAWEIBO_REDIRECTURI" Success:^(NSDictionary *message) {
        NSString *access_token = [message valueForKey:@"accessToken"];
        NSString *userID = [message valueForKey:@"userID"];
        NSDictionary *parameters = @{@"access_token":access_token,@"uid":userID};
        
        userInfo.token = access_token;
        userInfo.openid = userID;
//        [[WPAPIClient shardInstance] otherGet:OS_LOGIN_WB_URL
//                                   parameters:parameters
//                                      success:^(NSURLSessionDataTask *task, id responseObject) {
//                                          if (userInfo.loginType == WPUserLoginTypeWeibo) {
//                                              userInfo.rawData = responseObject;
//                                              !success?:success(userInfo);
//                                          }
//                                      } failure:nil enableJsonRequest:YES];
//        
    } Fail:^(NSDictionary *message, NSError *error) {
        !fail?:fail(message,error);
    }];
}


+(void)QQLoginSuccess:(OSLoginSuccess)success Fail:(OSLoginFail)fail
{
    loginSuccessCallback = success;
    loginFailCallback = fail;
    userInfo = [[OSUserInfo alloc]initWithLoginType:YFUserLoginTypeQQ];
    
    [OpenShare QQAuth:@"get_user_info" Success:^(NSDictionary *message) {
        NSString *access_token = [message valueForKey:@"access_token"];
        NSString *openid = [message valueForKey:@"openid"];
        NSDictionary *parameters = @{@"access_token":access_token,@"openid":openid,@"oauth_consumer_key":@"QQ_APPKEY"};
        userInfo.token = access_token;
        userInfo.openid = openid;
        
//        [[WPAPIClient shardInstance] otherGet:OS_LOGIN_QQ_URL
//                                   parameters:parameters
//                                      success:^(NSURLSessionDataTask *task, id responseObject) {
//                                          if (userInfo.loginType == WPUserLoginTypeQQ) {
//                                              userInfo.rawData = responseObject;
//                                              !success?:success(userInfo);
//                                          }
//                                      } failure:nil enableJsonRequest:YES];
    } Fail:^(NSDictionary *message, NSError *error) {
        !fail?:fail(message,error);
    }];
}
@end



@implementation OSUserInfo
-(instancetype)initWithLoginType:(YFUserLoginType)loginType
{
    self = [super init];
    if (self) {
        self.loginType = loginType;
    }
    return self;
}


- (void)setRawData:(NSDictionary *)rawData
{
    _rawData = rawData;
    if (rawData.count) {
        switch (self.loginType) {
            case YFUserLoginTypeWeixin:
            {
                self.nickName = rawData[@"nickname"];
                self.icon = rawData[@"headimgurl"];
                self.openid = rawData[@"openid"];
                self.unionid = rawData[@"unionid"];
            }
                break;
            case YFUserLoginTypeWeibo:
            {
                self.nickName = rawData[@"name"];
                self.icon = rawData[@"avatar_large"];
            }
                break;
            case YFUserLoginTypeQQ:
            {
                self.nickName = rawData[@"nickname"];
                self.icon = rawData[@"figureurl_2"];
            }
                break;
                
            default:
                break;
        }
    }
}
@end
