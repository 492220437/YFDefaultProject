//
//  NSDictionary+Convert.h
//  GWMovie
//
//  Created by YF on 2017/5/16.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Convert)
//下划线转驼峰
- (NSDictionary *)convertKeysToCamelCaseFromSnakeCase;
@end
