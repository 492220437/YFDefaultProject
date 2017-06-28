//
//  UIColor+RGBColor.m
//  WeiXinMovie
//
//  Created by sunjinxin on 2017/1/6.
//  Copyright © 2017年 sunjinxin. All rights reserved.
//

#import "UIColor+RGBColor.h"

@implementation UIColor (RGBColor)

- (CGFloat)RGBRed
{
    return CGColorGetComponents(self.CGColor)[UIColorRGBTypeRed];
}

- (CGFloat)RGBGreen
{
    return CGColorGetComponents(self.CGColor)[UIColorRGBTypeGreen];
}

- (CGFloat)RGBBlue
{
    return CGColorGetComponents(self.CGColor)[UIColorRGBTypeBlue];
}

- (CGFloat)RGBAlpha
{
    return CGColorGetComponents(self.CGColor)[UIColorRGBTypeAlpha];
}

@end
