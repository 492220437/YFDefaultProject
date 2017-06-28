//
//  UIView+MBIBnspectable.m
//
//  Created by YF on 2017/5/3.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MBIBnspectable)

@property (assign,nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign,nonatomic) IBInspectable CGFloat borderWidth;
@property (strong,nonatomic) IBInspectable UIColor  *borderColor;
@property (strong,nonatomic) IBInspectable UIColor  *shadowColor;


@end
