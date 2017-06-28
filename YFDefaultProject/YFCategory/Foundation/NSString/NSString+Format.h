//
//  NSString+Format.h
//  XueBa
//
//  Created by qpwang on 13-10-15.
//  Copyright (c) 2013年 SecretLisa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Format)

+ (NSString *)stringWithUnichar:(unichar)value;
//下划线转驼峰
+ (NSString *)convertToCamelCaseFromSnakeCase:(NSString *)key;
@end
