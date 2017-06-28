//
//  YFTextField.h
//  GWMovie
//
//  Created by YF on 2017/5/5.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
    左边带标题的UITextField
 */
@interface YFTextField : UITextField

- (void)setupWithTitle:(NSString*)title placeholder:(NSString*)placeholder;
- (void)setupWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder;

//是否支持系统自带的拷贝／剪贴／全选popview，default = YES；
@property (assign, nonatomic) BOOL canPerformAction;
@end
