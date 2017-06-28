//
//  YFBaseTableViewController.m
//  YFDefaultProject
//
//  Created by YF on 2017/6/27.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFBaseTableViewController.h"

@interface YFBaseTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
//@property (nonatomic, strong) MJRefreshHeaderView * refreshHeader;
//@property (nonatomic, strong) MJRefreshFooterView * refreshFooter;
@property (nonatomic, assign) BOOL isLoaded;
@end

@implementation YFBaseTableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        self.tableViewStyle = style;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
}

- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    _tableView.emptyCoverSource = nil;
    
//    if (self.refreshFooter) {
//        [self.refreshFooter free];
//        self.refreshFooter=nil;
//    }
//    if (self.refreshHeader) {
//        [self.refreshHeader free];
//        self.refreshHeader=nil;
//    }
//
}

#pragma mark - setup views
- (void)setupViews
{
    [super setupViews];
    self.tableView.width = [UIScreen mainScreen].bounds.size.width; //解决FDTemplateCell的warning
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)setupTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.emptyCoverSource = self;
    //如果实现了height代理方法，这里就无效，需要在代理方法里返回UITableViewAutomaticDimension或者计算的高度。
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 800;
    
//    //** 加上下刷新View
//    if (self.hasHeaderRefresh) {
//        [self addHeader];
//    }
//    
//    if (self.hasFooterRefresh) {
//        [self addFooter];
//    }

}

//-(void)setHasHeaderRefresh:(BOOL)hasHeaderRefresh
//{
//    _hasHeaderRefresh=hasHeaderRefresh;
//    if (!self.isLoaded) {
//        return;
//    }
//    if (hasHeaderRefresh) {
//        if (!self.refreshHeader) {
//            [self addHeader];
//        }
//    }
//    else
//    {
//        if (self.refreshHeader) {
//            [self.tableView removeHeader];
//        }
//    }
//}
//
//-(void)setHasFooterRefresh:(BOOL)hasFooterRefresh
//{
//    _hasFooterRefresh=hasFooterRefresh;
//    if (!self.isLoaded) {
//        return;
//    }
//    if (hasFooterRefresh) {
//        if (!self.refreshFooter) {
//            [self addFooter];
//        }
//    }
//    else
//    {
//        if (self.refreshFooter) {
//            [self.tableView removeFooter];
//            self.refreshFooter = nil;
//        }
//    }
//}
//
///**
// *  添加底部加载控件
// */
//- (void)addFooter
//{
//    __weak typeof(self) weakSelf=self;
//    [self.tableView addFooterWithCallback:^{
//        [weakSelf beginRefreshFromFooter];
//    }];
//    
//    MJRefreshFooterView *footer = [self.tableView footer];
//    [footer setIsShowLabel:NO];
//    [footer setCircleColor:_freshCircleColor?_freshCircleColor:[GWPColor navationBarBackColor]];
//    
//    self.refreshFooter = footer;
//    
//    
//}
//
///**
// *  添加顶部加载控件
// */
//- (void)addHeader
//{
//    __weak typeof(self) weakSelf=self;
//    [self.tableView addHeaderWithCallback:^{
//        [weakSelf beginRefreshFromHeader];
//    }];
//    
//    MJRefreshHeaderView *header = [self.tableView header];
//    [header setIsShowLabel:NO];
//    header.circlePercentView.isFromUp=YES;
//    [header setCircleColor:_freshCircleColor?_freshCircleColor:[GWPColor navationBarBackColor]];
//    
//    self.refreshHeader = header;
//}
//
//
//-(void)beginRefreshFromHeader
//{
//    
//}
//-(void)beginRefreshFromFooter
//{
//    
//}
//-(void)finishRefreshFromHeader
//{
//    if (self.refreshHeader) {
//        [self.refreshHeader endRefreshing];
//    }
//}
//
//-(void)finishRefreshFromFooter
//{
//    if (self.refreshFooter) {
//        [self.refreshFooter endRefreshing];
//    }
//}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    [footerView setBackgroundColor:[UIColor clearColor]];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
#pragma mark - WPScrollViewEmptyCoverSource methods
//子类重写这个方法，可以自动在无数据时显示友好提示view
- (UIView *)emptyCoverViewInScrollView:(UIScrollView *)scrollView
{
    return nil;
}
#pragma mark - property getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}


@end
