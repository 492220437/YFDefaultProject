//
//  UIView+SubviewTree.h
//  GWMovie
//
//  Created by YF on 2017/5/16.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 打印出view的子view树，并标明frame，直接显示层级关系。
 */
@interface UIView (SubviewTree)
-(NSString*)logSubviewTree;
@end
