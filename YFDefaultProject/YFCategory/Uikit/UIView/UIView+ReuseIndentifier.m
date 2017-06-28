//
//  UIView+ReuseIndentifier.m
//  WeiXinMovie
//
//  Created by qpwang on 6/4/15.
//  Copyright (c) 2015 qpwang. All rights reserved.
//

#import "UIView+ReuseIndentifier.h"

@implementation UIView (ReuseIndentifier)

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
