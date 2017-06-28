//
//  NSNull+Safe.m
//  WeiXinMovie
//
//  Created by wangqingpeng on 31/05/2017.
//  Copyright © 2017 wangqingpeng. All rights reserved.
//

#import "NSNull+Safe.h"

@implementation NSNull (Safe)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *signature = [super methodSignatureForSelector:sel];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:@encode(void)];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
}

@end
