//
//  YFAlertView.m
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/17.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "YFAlertView.h"
#import "UIImage+Color.h"

#define YFAlERT_W 290.

typedef NS_ENUM(NSUInteger, YFAlertButtonType) {
    YFAlertButtonTypeDefault,
    YFAlertButtonTypeCancel,
};


@interface YFAlertView()

#pragma mark 属性
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) NSMutableDictionary *actionDictionary;
#pragma mark UI
@property (strong, nonatomic) UIView *imageContainerView;
@property (strong, nonatomic) UIView *contentContainerView;
@property (strong, nonatomic) UIView *actionContainerView;

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *actionButton;
@property (strong, nonatomic) UIView *separator;

@end

@implementation YFAlertView
#pragma mark - Init
+(instancetype)alertWithTitle:(NSString*)title
{
    return [YFAlertView alertWithTitle:title message:nil];
}
+(instancetype)alertWithTitle:(NSString*)title message:(NSString *)message
{
    return [YFAlertView alertWithTitle:title message:message image:nil];
}
+(instancetype)alertWithTitle:(NSString*)title message:(NSString *)message image:(UIImage*)image
{
    return [[YFAlertView alloc] initWithTitle:title message:message image:image];
}

-(instancetype)initWithTitle:(NSString*)title
{
    return [self initWithTitle:title message:nil];
}
-(instancetype)initWithTitle:(NSString*)title message:(NSString *)message
{
    return [self initWithTitle:title message:message image:nil];
}
-(instancetype)initWithTitle:(NSString*)title message:(NSString *)message image:(UIImage*)image
{
    self = [super init];
    if (self) {
        self.title = title;
        self.message = message;
        self.image = image;
        [self updateView];
    }
    return self;
}

#pragma mark - View
- (void)updateView
{
    self.window.windowLevel = UIWindowLevelAlert + 10000000.000000;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    
    
    [self updateImageContainerView];
    [self updateContentContainerView];
    [self updateActionContainerView];
    
    
    [self.window addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.window);
        make.width.equalTo(@(YFAlERT_W));
        make.height.lessThanOrEqualTo(@([UIScreen mainScreen].bounds.size.height - 50));
    }];
    
}

- (void)updateImageContainerView
{
    self.imageView.image = self.image;
    CGFloat multiplied = self.image?(self.image.size.height/self.image.size.width):0;
 
    [self.imageContainerView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.imageContainerView);
        make.height.equalTo(self.imageView.mas_width).multipliedBy(multiplied);
    }];
    
    [self addSubview:self.imageContainerView];
    [self.imageContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
    }];
}

- (void)updateContentContainerView
{
    self.titleLabel.text = self.title;
    self.messageLabel.text = self.message;
    
    [self.contentContainerView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.greaterThanOrEqualTo(self.contentContainerView).offset(15);
        make.top.equalTo(self.contentContainerView).offset(25);
        make.centerX.equalTo(self.contentContainerView);
    }];
    
    [self.contentContainerView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.greaterThanOrEqualTo(self.contentContainerView).offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.bottom.equalTo(self.contentContainerView).offset(-25);
        make.centerX.equalTo(self.contentContainerView);
    }];
    
    [self addSubview:self.contentContainerView];
    [self.contentContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.imageContainerView.mas_bottom);
    }];
}

- (void)updateActionContainerView
{
    [self.actionContainerView addSubview:self.separator];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.actionContainerView);
        make.height.equalTo(@(1./[UIScreen mainScreen].nativeScale));
    }];
    
    [self.actionContainerView addSubview:self.actionButton];
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.actionContainerView);
        make.top.equalTo(self.actionContainerView).offset(1./[UIScreen mainScreen].nativeScale);
    }];
    
    [self.actionContainerView addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.actionContainerView);
        make.width.equalTo(@(0));
        make.right.equalTo(self.actionButton.mas_left);
        make.top.equalTo(self.actionContainerView).offset(1./[UIScreen mainScreen].nativeScale);
    }];
    
    [self addSubview:self.actionContainerView];
    [self.actionContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.top.equalTo(self.contentContainerView.mas_bottom);
        make.height.equalTo(@(46));
    }];
    
}

#pragma mark - Public
- (void)addCancelButtonWithTitle:(NSString *)title block:(void (^)())block
{
    [self.cancelButton setTitle:title?:@"取消" forState:UIControlStateNormal];
    if (block) {
        [self.actionDictionary setObject:block forKey:@(YFAlertButtonTypeCancel)];
    }
    [self.cancelButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(YFAlERT_W/2));
        make.right.equalTo(self.actionButton.mas_left).offset(-1./[UIScreen mainScreen].nativeScale);
    }];
}

- (void)setActionButtonWithTitle:(NSString *)title block:(void (^)())block
{
    [self.actionButton setTitle:title?:@"确定" forState:UIControlStateNormal];
    if (block) {
        [self.actionDictionary setObject:block forKey:@(YFAlertButtonTypeDefault)];
    }
}

#pragma mark - Private
- (void)buttonPress:(UIButton*)sender
{
    [self dismiss];
    id obj = [self.actionDictionary objectForKey:@(sender.tag)];
    if (obj) {
        ((void (^)())obj)();
    }
}

#pragma mark - OverWrite

-(void)wp_popupShowAnimationCompletionHandler:(void(^)(BOOL succeeded))completionHandler
{
    self.transform = CGAffineTransformMakeScale(0.9, 0.9);
    self.alpha = 0;
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                         self.alpha = 1;
                     } completion:^(BOOL finished) {
                         !completionHandler?:completionHandler(YES);
                     }];
}
-(void)wp_popupDismissAnimationCompletionHandler:(void(^)(BOOL succeeded))completionHandler
{
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(0.9, 0.9);
                         self.alpha = 0;
                     } completion:^(BOOL finished) {
                         !completionHandler?:completionHandler(YES);
                     }];
}

#pragma mark - Getter
- (UIView *)imageContainerView
{
    if (!_imageContainerView) {
        _imageContainerView = [[UIView alloc]init];
        _imageContainerView.backgroundColor = [UIColor clearColor];
    }
    return _imageContainerView;
}
- (UIView *)contentContainerView
{
    if (!_contentContainerView) {
        _contentContainerView = [[UIView alloc]init];
        _contentContainerView.backgroundColor = [UIColor clearColor];
    }
    return _contentContainerView;
}
- (UIView *)actionContainerView
{
    if (!_actionContainerView) {
        _actionContainerView = [[UIView alloc]init];
//        _actionContainerView.backgroundColor = [[WPAppSkin mainSkin] new_contentColorBlack5];
    }
    return _actionContainerView;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
//        _titleLabel.textColor = [[WPAppSkin mainSkin] new_contentColorBlack1];
//        _titleLabel.font = [[WPAppSkin mainSkin] systemFont16pt];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.numberOfLines = 0;
//        _messageLabel.textColor = [[WPAppSkin mainSkin] new_contentColorBlack3];
//        _messageLabel.font = [[WPAppSkin mainSkin] systemFont12pt];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _messageLabel;
}

- (UIView *)separator
{
    if (!_separator) {
        _separator = [[UIView alloc]init];
    }
    return _separator;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.tag = YFAlertButtonTypeCancel;
//        [_cancelButton.titleLabel setFont:[[WPAppSkin mainSkin] systemFont16pt]];
//        [_cancelButton setTitleColor:[[WPAppSkin mainSkin] new_contentColorBlack3] forState:UIControlStateNormal];
//        [_cancelButton setBackgroundImage:[UIImage imageWithColor:[[WPAppSkin mainSkin] new_contentColorGray6]] forState:UIControlStateHighlighted];
//        [_cancelButton setBackgroundImage:[UIImage imageWithColor:[[WPAppSkin mainSkin] new_contentColorWhite]] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIButton *)actionButton
{
    if (!_actionButton) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionButton setTitle:@"确定" forState:UIControlStateNormal];
        _actionButton.tag = YFAlertButtonTypeDefault;
//        [_actionButton.titleLabel setFont:[[WPAppSkin mainSkin] systemFont16pt]];
//        [_actionButton setTitleColor:[[WPAppSkin mainSkin] new_contentColorOrange1] forState:UIControlStateNormal];
//        [_actionButton setBackgroundImage:[UIImage imageWithColor:[[WPAppSkin mainSkin] new_contentColorGray6]] forState:UIControlStateHighlighted];
//        [_actionButton setBackgroundImage:[UIImage imageWithColor:[[WPAppSkin mainSkin] new_contentColorWhite]] forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButton;
}

- (NSMutableDictionary *)actionDictionary
{
    if (!_actionDictionary) {
        _actionDictionary = [[NSMutableDictionary alloc]init];
    }
    return _actionDictionary;
}

@end
