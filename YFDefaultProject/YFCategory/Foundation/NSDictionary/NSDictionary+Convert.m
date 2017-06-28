//
//  NSDictionary+Convert.m
//  GWMovie
//
//  Created by YF on 2017/5/16.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "NSDictionary+Convert.h"
#import "NSString+Format.h"

@implementation NSDictionary (Convert)
//下划线转驼峰
- (NSDictionary *)convertKeysToCamelCaseFromSnakeCase
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        id newKey = [NSString convertToCamelCaseFromSnakeCase:key];
        
        id newObj = obj;
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            newObj = [(NSDictionary*)obj convertKeysToCamelCaseFromSnakeCase];
        }
        
        [dic setValue:newObj forKey:newKey];
    }];
    
    return dic;
}
@end
