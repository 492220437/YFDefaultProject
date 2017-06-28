//
//  UIView+SubviewTree.m
//  GWMovie
//
//  Created by YF on 2017/5/16.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UIView+SubviewTree.h"

@implementation UIView (SubviewTree)

-(NSString*)logSubviewTree
{
    NSString *tree = [UIView logSubviewTree:self Prefix:@""];
    NSLog(@"\n%@",tree);
    return tree;
}


+ (NSMutableString*)logSubviewTree:(UIView*)view Prefix:(NSString*)prefix
{
    NSMutableString *tree = [[NSMutableString alloc]init];
    
    NSString *subPrefix = [NSString stringWithFormat:@"%@  |",prefix];
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tree appendString:subPrefix];
        [tree appendString:@"--"];
        [tree appendString:NSStringFromClass(obj.class)];
        [tree appendString:@"  "];
        [tree appendString:NSStringFromCGRect(obj.frame)];
        [tree appendString:@"\n"];
        
        [tree appendString:[UIView logSubviewTree:obj Prefix:subPrefix]];
    }];
    return tree;
}

@end
