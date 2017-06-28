//
//  NSArray+Safe.m
//  WeiXinMovie
//
//  Created by YF on 2016/11/23.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "NSArray+Safe.h"
#import "NSObject+ImpChangeTool.h"
//#import "WPAlertView.h"

@implementation NSArray (Safe)
+ (void)load{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        [self swizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArray0" toSafeMethodString:@"wp_0_objectAtIndex:" targetClassString:@"NSArray"];
        [self swizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArrayI" toSafeMethodString:@"wp_I_objectAtIndex:" targetClassString:@"NSArray"];
        [self swizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wp_M_objectAtIndex:" targetClassString:@"NSArray"];
        [self swizzlingMethod:@"objectAtIndexedSubscript:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wp_M_objectAtIndexedSubscript:" targetClassString:@"NSArray"];
        [self swizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSSingleObjectArrayI" toSafeMethodString:@"wp_S_objectAtIndex:" targetClassString:@"NSArray"];
        [self swizzlingMethod:@"initWithObjects:count:" systemClassString:@"__NSPlaceholderArray" toSafeMethodString:@"initWithObjects_wp_safe:count:" targetClassString:@"NSArray"];
        
    });
}
- (id)wp_0_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return nil;
    }
    return [self wp_0_objectAtIndex:index];
}
- (id)wp_I_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return nil;
    }
    return [self wp_I_objectAtIndex:index];
}

- (id)wp_M_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return nil;
    }
    return [self wp_M_objectAtIndex:index];
}

- (id)wp_M_objectAtIndexedSubscript:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return nil;
    }
    return [self wp_M_objectAtIndexedSubscript:index];
}


- (id)wp_S_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return nil;
    }
    return [self wp_S_objectAtIndex:index];
}

//这里要不能加前缀，只能加后缀。类簇实例方法不识别。
- (instancetype)initWithObjects_wp_safe:(id *)objects count:(NSUInteger)count {
    NSUInteger newCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects[i]) {
//            if (![WPCommonDefine sharedInstance].warningDev) {
//                WPAlertView *alert = [[WPAlertView alloc]initWithTitle:@"数组中不能插入nil" message:[NSString stringWithFormat:@"self=%@\nsel=%@\nindex=%ld\nobjs = %@",self,NSStringFromSelector(_cmd),i,*objects]];
//                [alert show];
//            }
            break;
        }
        newCount++;
    }
    self = [self initWithObjects_wp_safe:objects count:newCount];
    return self;
}



- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSMutableDictionary *dic = [@{} mutableCopy];
    if ([dic respondsToSelector:aSelector]) {
//        if (![WPCommonDefine sharedInstance].warningDev) {
//            WPAlertView *alert = [[WPAlertView alloc]initWithTitle:[NSString stringWithFormat:@"把Dic当成了Array"] message:[NSString stringWithFormat:@"sel=%@\nself=%@",NSStringFromSelector(aSelector),self]];
//            [alert show];
//        }
        return dic;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (void)showWarningWithIndex:(NSInteger)index
{
//    if (![WPCommonDefine sharedInstance].warningDev) {
//        WPAlertView *alert = [[WPAlertView alloc]initWithTitle:@"数组越界" message:[NSString stringWithFormat:@"index = %ld\narray.count = %ld\narray%@",index,self.count,self]];
//        [alert show];
//    }
}

@end



@implementation NSMutableArray (Safe)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingMethod:@"addObject:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wp_safe_addObject:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingMethod:@"insertObject:atIndex:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wp_safe_insertObject:atIndex:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingMethod:@"removeObjectAtIndex:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wp_safe_removeObjectAtIndex:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingMethod:@"replaceObjectAtIndex:withObject:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wp_safe_safe_replaceObjectAtIndex:withObject:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingMethod:@"removeObjectsAtIndexes:" systemClassString:@"NSMutableArray" toSafeMethodString:@"wp_safe_removeObjectsAtIndexes:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingMethod:@"removeObjectsInRange:" systemClassString:@"NSMutableArray" toSafeMethodString:@"wp_safe_removeObjectsInRange:" targetClassString:@"NSMutableArray"];
    });
}
- (void)wp_safe_addObject:(id)anObject{
    if (!anObject) {
        return;
    }
    [self wp_safe_addObject:anObject];
}
- (void)wp_safe_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > [self count]) {
        [self showWarningWithIndex:index];
        return;
    }
    if (!anObject) {
        return;
    }
    [self wp_safe_insertObject:anObject atIndex:index];
}
- (void)wp_safe_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return;
    }
    
    return [self wp_safe_removeObjectAtIndex:index];
}
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= [self count]) {
        [self showWarningWithIndex:index];
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}
- (void)wp_safe_removeObjectsAtIndexes:(NSIndexSet *)indexes{
    NSMutableIndexSet * mutableSet = [NSMutableIndexSet indexSet];
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < [self count ]) {
            [mutableSet addIndex:idx];
        }
    }];
    [self wp_safe_removeObjectsAtIndexes:mutableSet];
}
- (void)wp_safe_removeObjectsInRange:(NSRange)range{
    //获取最大索引
    if (range.location + range.length - 1 < [self count]) {
        [self wp_safe_removeObjectsInRange:range];
        return;
    }
    if (range.location >= [self count]) {
        return;
    }
    NSInteger tempInteger = range.location + range.length - 1;
    while (tempInteger >= [self count]) {
        tempInteger -= 1;
    }
    NSRange tempRange = NSMakeRange(range.location, tempInteger + 1 -range.location);
    [self wp_safe_removeObjectsInRange:tempRange];
}

@end
