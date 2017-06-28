//
//  YFPopupWindow.m
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/17.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "YFPopupWindow.h"
@interface YFPopupWindow()

@property (nonatomic, strong) UIVisualEffectView * effectView;

@end

@implementation YFPopupWindow


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupWindow];
    }
    return self;
}

- (void)setupWindow
{
    //rootViewController只做默认设置，防止意外crash，不做view承载。有需要自己实现vc并赋值rootViewController；
    UIViewController *vc = [[UIViewController alloc]init];
    
    vc.view.backgroundColor = [UIColor clearColor];
    
    vc.view.userInteractionEnabled = NO;
    
    self.rootViewController = vc;
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    self.frame = [[UIScreen mainScreen] bounds];
    
    //暂时不加毛玻璃
//    [self addSubview:self.effectView];
//    
//    [self.effectView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.edges.equalTo(self);
//    }];
    
    self.hidden = YES;
}


#pragma mark getter
- (UIVisualEffectView *)effectView
{
    if (!_effectView) {
        
        _effectView = [[UIVisualEffectView alloc] init];
        
        UIBlurEffect *bulurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        
        _effectView.effect = bulurEffect;
        
    }
    
    return _effectView;
}

- (void)dealloc
{
    
}
@end
