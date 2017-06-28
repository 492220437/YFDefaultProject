//
//  UIView+ReuseIndentifier.h
//  WeiXinMovie
//
//  Created by qpwang on 6/4/15.
//  Copyright (c) 2015 qpwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ReuseIndentifier)

+ (UINib *)nib;
+ (NSString *)cellReuseIdentifier;

@end
