//
//  NSString+Hash.h
//  WeiXinMovie
//
//  Created by 杨峰 on 16/3/8.
//  Copyright © 2016年 杨峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)
@property (readonly) NSString *MD5Hash;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end
