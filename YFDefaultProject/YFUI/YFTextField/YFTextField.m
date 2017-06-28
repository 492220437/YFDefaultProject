//
//  YFTextField.m
//  GWMovie
//
//  Created by YF on 2017/5/5.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "YFTextField.h"

@interface YFTextField()
@property (strong, nonatomic) UILabel *textLabel;
@end

@implementation YFTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupWithTitle:(NSString*)title placeholder:(NSString*)placeholder
{
    [self setupWithTitle:title text:nil placeholder:placeholder];
}

- (void)setupWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder
{
    self.textLabel.text = title;
    self.text = text;
    self.placeholder = placeholder;
}


- (void)setupView
{
    //Base
    self.borderStyle = UITextBorderStyleNone;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.font = [UIFont systemFontOfSize:14];
    self.textColor = [UIColor blackColor];
    self.canPerformAction = YES;
    
    // 使用KVO改变UITextField的Placeholder
    [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    
    //LeftView
    self.leftView = self.textLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
    
}

#pragma mark overrides
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGSize size  =  [self.textLabel sizeThatFits:bounds.size];
    return CGRectMake(0, 0, size.width + 20, bounds.size.height);
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return self.canPerformAction;
}

#pragma mark Getter
- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.textColor = [UIColor blackColor];
    }
    return _textLabel;
}

@end
