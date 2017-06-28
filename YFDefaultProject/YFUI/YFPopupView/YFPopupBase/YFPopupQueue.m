//
//  YFPopupQueue.m
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/18.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "YFPopupQueue.h"
#import "YFPopupView.h"

@interface YFPopupQueue()
@property (nonatomic, strong) YFPopupView * currentPopupView;
@property (nonatomic, strong) NSMutableArray * queueArray;
@end

@implementation YFPopupQueue

+ (YFPopupQueue *)sharedQueue;
{
    static YFPopupQueue *queue;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        queue = [[YFPopupQueue alloc] init];
    });
    return queue;
}
+ (void)queueAddPopupView:(YFPopupView*)popupView
{
    if (!popupView) return;
    [[YFPopupQueue sharedQueue].queueArray addObject:popupView];
    if ([YFPopupQueue sharedQueue].currentPopupView == nil) {        
        [[YFPopupQueue sharedQueue] showNextPopupView];
    }
}
+ (void)queueRemovePopupView:(YFPopupView*)popupView
{
    if (!popupView) return;
    [[YFPopupQueue sharedQueue].queueArray removeObject:popupView];
    if ([YFPopupQueue sharedQueue].currentPopupView == popupView) {
        [[YFPopupQueue sharedQueue] dismissCurrentPopupView];
    }
}
- (void)showNextPopupView
{
    YFPopupView *popupView = [self.queueArray firstObject];
    self.currentPopupView = popupView;
    popupView.window.hidden = NO;
    [popupView wp_popupShowAnimationCompletionHandler:^(BOOL succeeded) {
        
    }];
}

- (void)dismissCurrentPopupView
{
    YFPopupView *popupView = self.currentPopupView;
    [popupView wp_popupDismissAnimationCompletionHandler:^(BOOL succeeded) {
        self.currentPopupView = nil;
        popupView.window.hidden = YES;
        [popupView removeFromSuperview];
        [self showNextPopupView];
    }];
}


- (NSMutableArray *)queueArray
{
    if (!_queueArray) {
        _queueArray = [[NSMutableArray alloc] init];
    }
    return _queueArray;
}
@end
