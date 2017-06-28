//
//  YFBaseTableViewController.h
//  YFDefaultProject
//
//  Created by YF on 2017/6/27.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFBaseViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface YFBaseTableViewController : YFBaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readonly) UITableView *tableView;
//@property (nonatomic, readonly) MJRefreshHeaderView * refreshHeader;
//@property (nonatomic, readonly) MJRefreshFooterView * refreshFooter;

- (instancetype)initWithStyle:(UITableViewStyle)style;
///**
// *  是否有顶部的下拉刷新 默认：无
// */
//@property (nonatomic,assign) BOOL hasHeaderRefresh;
//
///**
// *  是否有底部的上拉加载 默认：无
// */
//@property (nonatomic,assign) BOOL hasFooterRefresh;
//
///**
// *  下拉开始刷新
// */
//-(void)beginRefreshFromHeader;
//
///**
// *  上拉开始加载
// */
//-(void)beginRefreshFromFooter;
//
///**
// *  结束顶部刷新时
// */
//-(void)finishRefreshFromHeader;
//
///**
// *  结束底部加载时
// */
//-(void)finishRefreshFromFooter;
//
///**
// *  更新上次更新时间
// */
//-(void)updateLastUpdateTime;


@end
