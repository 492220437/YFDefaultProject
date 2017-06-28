//
//  YFPopupView.h
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/17.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFPopupWindow.h"

/*
 *  只做页面显示消失动画，动画完成后一定调用completionHandler回调。window的生命周期有Queue管理
 *  不写代码，只回调completionHandler，同无动画弹出。
 *
 */
@protocol YFPopupAnimation

-(void)wp_popupShowAnimationCompletionHandler:(void(^)(BOOL succeeded))completionHandler;
-(void)wp_popupDismissAnimationCompletionHandler:(void(^)(BOOL succeeded))completionHandler;

@end

/*
 *  弹出页面基类，没做任何UI
 *  实现子类，用于用于布局UI来实现ALert。ActionSheet。HUD。和自定义效果。
 *  默认没有弹出消失动画，需要自定义，请重写YFPopupAnimation的方法。默认已经遵循了该协议。
 *
 */
@interface YFPopupView : UIView<YFPopupAnimation>

@property (nonatomic, strong, readonly) YFPopupWindow *window;

- (void)show NS_REQUIRES_SUPER;
- (void)dismiss NS_REQUIRES_SUPER;
@end
