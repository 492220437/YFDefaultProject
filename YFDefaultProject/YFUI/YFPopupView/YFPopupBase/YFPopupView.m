//
//  YFPopupView.m
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/17.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "YFPopupView.h"
#import "YFPopupQueue.h"
@interface YFPopupView()

@property (nonatomic, strong) YFPopupWindow *window;

@end

@implementation YFPopupView


- (void)show
{
    [YFPopupQueue queueAddPopupView:self];
}
- (void)dismiss
{
    [YFPopupQueue queueRemovePopupView:self];
}

-(void)wp_popupShowAnimationCompletionHandler:(void(^)(BOOL succeeded))completionHandler
{
    !completionHandler?:completionHandler(YES);
}
-(void)wp_popupDismissAnimationCompletionHandler:(void(^)(BOOL succeeded))completionHandler
{
    !completionHandler?:completionHandler(YES);
}

- (YFPopupWindow *)window
{
    if (!_window) {
        _window = [[YFPopupWindow alloc] init];
    }
    return _window;
}


- (void)dealloc
{
    
}
@end
