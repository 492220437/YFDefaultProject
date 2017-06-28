//
//  NSString+Format.m
//  XueBa
//
//  Created by qpwang on 13-10-15.
//  Copyright (c) 2013年 SecretLisa. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

+ (NSString*)stringWithUnichar:(unichar)value
{
    NSString* string = [NSString stringWithFormat:@"%C",value];
    return string;
}

+ (NSString *)convertToCamelCaseFromSnakeCase:(NSString *)key {
    if (![key isKindOfClass:[NSString class]]) {
        return key;
    }
    NSMutableString *str = [NSMutableString stringWithString:key];
    while ([str containsString:@"_"]) {
        NSRange range = [str rangeOfString:@"_"];
        if (range.location + 1 < [str length]) {
            char c = [str characterAtIndex:range.location+1];
            [str replaceCharactersInRange:NSMakeRange(range.location, range.length+1) withString:[[NSString stringWithFormat:@"%c",c] uppercaseString]];
        }
    }
    return str;
}
@end
