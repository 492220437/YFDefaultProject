//
//  UIScrollView+EmptyCover.h
//  NoData
//
//  Created by YANGFENG on 15/9/17.
//  Copyright (c) 2015年 杨峰. All rights reserved.
//
/**
 *  第一步：引用<WPScrollViewEmptyCoverSource>
 *  第二步：设置self.emptyCoverSource = self;
 *  第三步：实现emptyCoverViewInScrollView，自定义后return 即可。
 *
 */
#import <UIKit/UIKit.h>

@protocol WPScrollViewEmptyCoverSource <NSObject>
/**
 *  UIScrollViewEmptyCoverSource用于配置浮层view
 *
 *  @param scrollView     当前scrollview
 *
 *  @return 返回一个view，可以为nil；
 */
- (UIView*)emptyCoverViewInScrollView:(UIScrollView*)scrollView ;


@end

/**
 *  主逻辑在这里，方便通用于tableview和collectionview
 */
@interface UIScrollView (EmptyCover)
/**
 *  浮层。
 */
@property(strong, nonatomic) UIView* emptyCoverView;
/**
 *  代理。
 */
@property(weak, nonatomic) id <WPScrollViewEmptyCoverSource> emptyCoverSource;
/**
 *  可以在配置EmptyCoverView时获取，用来传递一些信息，比如提示信息，或者判断是空还是网络问题。默认为nil；
 */
@property(strong, nonatomic) NSDictionary *userInfo;
/**
 *  在否页面初始化的时候就生效，一般页面初始都是空页面，等待网络请求回来才加载数据，如果在网络请求回来前显示无数据页面不友好。default = NO；
 */
@property(assign, nonatomic) BOOL validOnInit;
@end
