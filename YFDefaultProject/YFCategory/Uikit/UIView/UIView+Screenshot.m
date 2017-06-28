//
//  UIView+Screenshot.m
//  GWMovie
//
//  Created by apple on 2017/4/28.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UIView+Screenshot.h"
#import <Masonry.h>

@implementation UIView (Screenshot)

- (UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates unitSize:(CGSize)unitSize{
    
    CGAffineTransform originTransform = self.transform;
    
    self.transform = CGAffineTransformIdentity;
    
    UIView *snapshotView = [UIView new];
    
    NSInteger colMax = ceil(self.frame.size.width / unitSize.width);
    NSInteger rowMax = ceil(self.frame.size.height / unitSize.height);
    
    CGFloat width = self.frame.size.width;
    if (colMax) {
        width = self.frame.size.width / colMax;
    }
    
    CGFloat height = self.frame.size.height;
    if (rowMax) {
        height = self.frame.size.height / rowMax;
    }
    
    UIView *lastView = nil;
    for(int i = 0; i < colMax; i++){
        
        UIView *rowView = [self resizableSnapshotViewFromRect:CGRectMake(i*width, 0, width, height) afterScreenUpdates:afterUpdates withCapInsets:UIEdgeInsetsZero];
        [snapshotView addSubview:rowView];
        [rowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(snapshotView);
            if(lastView){
                make.left.equalTo(lastView.mas_right);
                make.width.mas_equalTo(lastView);
                make.height.mas_equalTo(lastView);
            }else{
                make.left.equalTo(snapshotView);
            }
            if (i == colMax-1) {
                make.right.equalTo(snapshotView);
            }
            if (rowMax == 1) {
                make.bottom.equalTo(snapshotView);
            }
        }];
        
        lastView = rowView;
        for (int j = 1; j < rowMax; j++) {
            UIView *colView = [self resizableSnapshotViewFromRect:CGRectMake(i*width, j*height, width, height) afterScreenUpdates:afterUpdates withCapInsets:UIEdgeInsetsZero];
            [snapshotView addSubview:colView];
            [colView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastView.mas_bottom);
                make.width.mas_equalTo(lastView);
                make.height.mas_equalTo(lastView);
                make.left.equalTo(lastView);
                if(j == rowMax-1){
                    make.bottom.equalTo(snapshotView);
                }
            }];
            
            lastView = colView;
        }
    }
    
    self.transform = originTransform;
    
    return snapshotView;
}

@end
