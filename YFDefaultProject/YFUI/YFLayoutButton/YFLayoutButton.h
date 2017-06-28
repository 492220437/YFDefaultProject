//
//  YFLayoutButton.h
//  GWMovie
//
//  Created by YF借鉴 on 2017/5/5.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YFLayoutButtonStyle) {
    YFLayoutButtonStyleLeftImageRightTitle,
    YFLayoutButtonStyleLeftTitleRightImage,
    YFLayoutButtonStyleUpImageDownTitle,
    YFLayoutButtonStyleUpTitleDownImage
};

// 可以让button 图标和标题上下左右排列
// 重写layoutSubviews的方式实现布局，忽略imageEdgeInsets、titleEdgeInsets和contentEdgeInsets
// 初步只更改布局方式，后续更具需求开放其他参数熟悉。
@interface YFLayoutButton : UIButton


// 布局方式
@property (nonatomic, assign) YFLayoutButtonStyle layoutStyle;
// 图片和文字的间距，默认值4
@property (nonatomic, assign) CGFloat midSpacing;

@end
