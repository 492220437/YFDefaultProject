//
//  CommonMethodMacros.h
//  YFDefaultProject
//
//  Created by YF on 2017/6/27.
//  Copyright © 2017年 YF. All rights reserved.
//

#ifndef CommonMethodMacros_h
#define CommonMethodMacros_h

////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSLog

#if DEBUG

#define NSLog(format, ...) do {                                                                          \
    fprintf(stderr, "<%s : %d> %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, __func__);                                                (NSLog)((format), ##__VA_ARGS__);fprintf(stderr, "-------\n");                            } while (0)
#else

#define NSLog(...){}

#endif
////////////////////////////////////////////////////////////////////////////////
#pragma mark - WEAK

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

////////////////////////////////////////////////////////////////////////////////
#pragma mark - AD_ID

#define WPDeprecated(instead) DEPRECATED_MSG_ATTRIBUTE(" 使用 " # instead " 代替")

////////////////////////////////////////////////////////////////////////////////
#pragma mark - OnExit

#define OnExit __strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^

static void blockCleanUp(__strong void(^*block)(void))
{
    (*block)();
}
////////////////////////////////////////////////////////////////////////////////

#endif /* CommonMethodMacros_h */
