//
//  UIImage+Blur.h
//  XueBa
//
//  Created by zhangliaoyuan on 1/6/17.
//  Copyright (c) 2017 SecretLisa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>


@interface UIImage (Blur)

+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
