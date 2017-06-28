//
//  UIView+MBIBnspectable.m
//
//  Created by YF on 2017/5/3.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UIView+MBIBnspectable.h"

@implementation UIView (MBIBnspectable)

#pragma mark - setCornerRadius/borderWidth/borderColor
- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setShadowColor:(UIColor *)shadowColor{
    self.layer.shadowColor = shadowColor.CGColor;
    
    self.layer.shadowOpacity = 1;
    
    self.layer.shadowOffset = CGSizeZero;
    
}

- (UIColor *)shadowColor{
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}


@end
