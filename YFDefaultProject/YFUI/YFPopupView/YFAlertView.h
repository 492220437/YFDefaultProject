//
//  YFAlertView.h
//  MMPopupView
//
//  Created by 杨峰 on 2016/10/17.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "YFPopupView.h"
#import <Masonry.h>


@interface YFAlertView : YFPopupView

@property (strong, nonatomic, readonly) UILabel *messageLabel;

+(instancetype)alertWithTitle:(NSString*)title;
+(instancetype)alertWithTitle:(NSString*)title message:(NSString *)message;
+(instancetype)alertWithTitle:(NSString*)title message:(NSString *)message image:(UIImage*)image;

-(instancetype)initWithTitle:(NSString*)title;
-(instancetype)initWithTitle:(NSString*)title message:(NSString *)message;
-(instancetype)initWithTitle:(NSString*)title message:(NSString *)message image:(UIImage*)image;



//默认已经实现了ActionButton 标题是“确定”
- (void)addCancelButtonWithTitle:(NSString *)title block:(void (^)())block;
- (void)setActionButtonWithTitle:(NSString *)title block:(void (^)())block;

@end
