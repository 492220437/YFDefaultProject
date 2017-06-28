//
//  NSDictionary+Safe.m
//  WeiXinMovie
//
//  Created by YF on 2016/11/23.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import <objc/runtime.h>
#import "NSObject+ImpChangeTool.h"
//#import "WPAlertView.h"
@implementation NSDictionary (Safe)

+ (void)load{
    [self swizzlingMethod:@"initWithObjects:forKeys:count:" systemClassString:@"__NSPlaceholderDictionary" toSafeMethodString:@"initWithObjects_wp_safe:forKeys:count:" targetClassString:@"NSDictionary"];
}

//这里要不能加前缀，只能加后缀。类簇实例方法不识别。
-(instancetype)initWithObjects_wp_safe:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
//            if (![WPCommonDefine sharedInstance].warningDev) {
//                WPAlertView *alert = [[WPAlertView alloc]initWithTitle:@"字典中不能插入nil" message:[NSString stringWithFormat:@"self=%@\nindex = %ld\nkeys = %@\nobjs = %@\n",self,rightCount,*keys,*objects]];
//                [alert show];
//            }

            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_wp_safe:objects forKeys:keys count:rightCount];
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSMutableArray *array = [@[] mutableCopy];
    if ([array respondsToSelector:aSelector]) {
//        if (![WPCommonDefine sharedInstance].warningDev) {
//            WPAlertView *alert = [[WPAlertView alloc]initWithTitle:[NSString stringWithFormat:@"把Array当成了Dic"] message:[NSString stringWithFormat:@"self=%@\nsel=%@",self,NSStringFromSelector(aSelector)]];
//            [alert show];
//        }
        return array;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (void)showWarningWithKey:(id)key value:(id)obj sel:(SEL)sel
{
//    if (![WPCommonDefine sharedInstance].warningDev) {
//        WPAlertView *alert = [[WPAlertView alloc]initWithTitle:@"字典的key为nil" message:[NSString stringWithFormat:@"sel=%@\nkey = %@\value = %@\ndic=%@",NSStringFromSelector(sel),key,obj,self]];
//        [alert show];
//    }
}
@end

@implementation NSMutableDictionary (Safe)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingMethod:@"wp_safe_removeObjectForKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"removeObjectForKey:" targetClassString:@"__NSDictionaryM"];
        [self swizzlingMethod:@"wp_safe_setObject:forKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"setObject:forKey:" targetClassString:@"__NSDictionaryM"];
        [self swizzlingMethod:@"wp_safe_setValue:forKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"setValue:forKey:" targetClassString:@"__NSDictionaryM"];
    });
}
- (void)wp_safe_removeObjectForKey:(id)key {
    if (!key) {
        [self showWarningWithKey:key value:nil sel:_cmd];
        return;
    }
    [self wp_safe_removeObjectForKey:key];
}

- (void)wp_safe_setObject:(id)obj forKey:(id <NSCopying>)key {
    if (!obj) {
        return;
    }
    if (!key) {
        [self showWarningWithKey:key value:obj sel:_cmd];
        return;
    }
    [self wp_safe_setObject:obj forKey:key];
}

- (void)wp_safe_setValue:(id)obj forKey:(id <NSCopying>)key {
    if (!obj) {
        return;
    }
    if (!key) {
        [self showWarningWithKey:key value:obj sel:_cmd];
        return;
    }
    [self wp_safe_setValue:obj forKey:key];
}
@end
