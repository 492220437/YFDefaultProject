//
//  UIImage+Color.h
//  XueBa
//
//  Created by qpwang on 8/1/14.
//  Copyright (c) 2014 SecretLisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
