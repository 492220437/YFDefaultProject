//
//  YFPopupQueue.h
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/18.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YFPopupView;

/*
 *  弹窗队列。
 *  多个弹窗，遵循先进先出。
 *
 */
@interface YFPopupQueue : NSObject
+ (YFPopupQueue *)sharedQueue;
+ (void)queueAddPopupView:(YFPopupView*)popupView;
+ (void)queueRemovePopupView:(YFPopupView*)popupView;
@end
