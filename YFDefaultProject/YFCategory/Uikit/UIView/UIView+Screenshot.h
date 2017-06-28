//
//  UIView+Screenshot.h
//  GWMovie
//
//  Created by apple on 2017/4/28.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

- (UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates unitSize:(CGSize)unitSize;

@end
