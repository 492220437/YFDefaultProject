//
//  UIColor+HexColor.h
//  XueBa
//
//  Created by qpwang on 10/15/13.
//  Copyright (c) 2013 SecretLisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *) colorWithHex:(NSInteger)rgbHexValue;

+ (UIColor *) colorWithHex:(NSInteger)rgbHexValue alpha:(CGFloat)alpha;

+ (UIColor *) colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
