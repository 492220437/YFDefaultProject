//
//  YFBaseViewController.m
//  YFDefaultProject
//
//  Created by YF on 2017/6/27.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFBaseViewController.h"

@interface YFBaseViewController ()

@end

@implementation YFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup views
- (void)setupViews
{
    
}

#pragma mark - setting
- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // You do not need this method if you are not supporting earlier iOS Versions
    //    return [self.topViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    return NO;
}


#pragma mark - event response

#pragma mark - Getter

@end
