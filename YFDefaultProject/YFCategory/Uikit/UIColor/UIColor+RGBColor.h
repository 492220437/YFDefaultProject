//
//  UIColor+RGBColor.h
//  WeiXinMovie
//
//  Created by sunjinxin on 2017/1/6.
//  Copyright © 2017年 sunjinxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIColorRGBType) {
    UIColorRGBTypeRed,
    UIColorRGBTypeGreen,
    UIColorRGBTypeBlue,
    UIColorRGBTypeAlpha,
};

@interface UIColor (RGBColor)

- (CGFloat)RGBRed;
- (CGFloat)RGBGreen;
- (CGFloat)RGBBlue;
- (CGFloat)RGBAlpha;

@end
