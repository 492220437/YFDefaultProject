//
//  UIScrollView+EmptyCover.m
//  NoData
//
//  Created by YANGFENG on 15/9/17.
//  Copyright (c) 2015年 杨峰. All rights reserved.
//

#import "UIScrollView+EmptyCover.h"
#import <objc/runtime.h>

NSString const *EmptyCoverView = @"EmptyCoverView";
NSString const *EmptyCoverSource = @"EmptyCoverSource";
NSString const *EmptyCoverUserInfo = @"EmptyCoverUserInfo";
NSString const *EmptyCoverValidOnInit = @"EmptyCoverValidOnInit";
NSString const *EmptyCoverCountOfCallReloadData = @"EmptyCoverCountOfCallReloadData";

@interface UIScrollView ()
@property(assign, nonatomic) NSInteger countOfCallReloadData;
@end

@implementation UIScrollView (EmptyCover)
//浮层
-(void)setEmptyCoverView:(UIView *)emptyCoverView
{
     objc_setAssociatedObject(self, &EmptyCoverView, emptyCoverView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView *)emptyCoverView
{
    return  objc_getAssociatedObject(self, &EmptyCoverView);
}

-(void)setUserInfo:(NSDictionary *)userInfo
{
    objc_setAssociatedObject(self, &EmptyCoverUserInfo, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSDictionary *)userInfo
{
    return  objc_getAssociatedObject(self, &EmptyCoverUserInfo);
}

-(void)setEmptyCoverSource:(id<WPScrollViewEmptyCoverSource>)emptyCoverSource
{
    objc_setAssociatedObject(self, &EmptyCoverSource, emptyCoverSource, OBJC_ASSOCIATION_ASSIGN);
}

-(id<WPScrollViewEmptyCoverSource>)emptyCoverSource
{
    return  objc_getAssociatedObject(self, &EmptyCoverSource);
}

-(BOOL)validOnInit
{
    return  [objc_getAssociatedObject(self, &EmptyCoverValidOnInit) boolValue];
}

-(void)setValidOnInit:(BOOL)validOnInit{
    objc_setAssociatedObject(self, &EmptyCoverValidOnInit, @(validOnInit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSInteger)countOfCallReloadData
{
    return  [objc_getAssociatedObject(self, &EmptyCoverCountOfCallReloadData) integerValue];
}

- (void)setCountOfCallReloadData:(NSInteger)countOfCallReloadData
{
    objc_setAssociatedObject(self, &EmptyCoverCountOfCallReloadData, @(countOfCallReloadData), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)reloadEmptyCover
{
    self.countOfCallReloadData++;
    
    if (!self.validOnInit && self.countOfCallReloadData <= 1) {
        return;
    }
    
    if (!self.emptyCoverSource||![self.emptyCoverSource conformsToProtocol:@protocol(WPScrollViewEmptyCoverSource) ]) {
        
        return;
    }
    
    if ([self itemCount]>0) {
        
        [self.emptyCoverView removeFromSuperview];
    }
    else
    {
        if (!self.emptyCoverView) {
  
            self.emptyCoverView = [self.emptyCoverSource emptyCoverViewInScrollView :self];
        }
        if (self.emptyCoverView && !self.emptyCoverView.superview) {

            if (self.superview) {
                [self.superview addSubview:self.emptyCoverView];
                
                UIEdgeInsets insets = self.contentInset;
                [self.emptyCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(self).insets(insets);
                }]; 
            }
        }
    }
    
}
-(NSInteger)itemCount
{
    NSInteger items = 0;
    
    if ([self isKindOfClass:[UITableView class]]) {
        
        UITableView *view = (UITableView*)self;
        
        if (view.dataSource) {
            
            if ([view.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
                
                NSInteger section = [view.dataSource numberOfSectionsInTableView:view];
                
                for (int i = 0; i < section; i++) {
                    
                    items += [view.dataSource tableView:view numberOfRowsInSection:i];
                }
                
            }
            else
            {
                items = [view.dataSource tableView:view numberOfRowsInSection:0];
            }
        }
 
    }
    else if ([self isKindOfClass:[UICollectionView class]]) {
        
        UICollectionView *view = (UICollectionView*)self;
        
        if (view.dataSource) {
            
            if ([view.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
                
                NSInteger section = [view.dataSource numberOfSectionsInCollectionView:view];
                
                for (int i = 0; i < section; i++) {
                    
                    items += [view.dataSource collectionView:view numberOfItemsInSection:i];
                }
                
            }
            else
            {
                items = [view.dataSource collectionView:view numberOfItemsInSection:0];
            }
        }
        
    }
    return items;
}
@end



@implementation UITableView (EmptyCover)

+ (void)initialize
{
    if (self == [UITableView self]) {
        
        SEL originalSelector = @selector(reloadData);
        
        SEL swizzledSelector = @selector(yf_reloadData);
        
        Method originalMethod = class_getInstanceMethod(self.class, originalSelector);
        
        Method swizzledMethod = class_getInstanceMethod(self.class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)yf_reloadData
{
    [self yf_reloadData];
    [self reloadEmptyCover];
}
@end


@implementation UICollectionView (EmptyCover)
+ (void)initialize
{
    if (self == [UICollectionView self]) {
        
        SEL originalSelector = @selector(reloadData);
        
        SEL swizzledSelector = @selector(yf_reloadData);
        
        Method originalMethod = class_getInstanceMethod(self.class, originalSelector);
        
        Method swizzledMethod = class_getInstanceMethod(self.class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)yf_reloadData
{
    [self yf_reloadData];
    [self reloadEmptyCover];
}

@end

