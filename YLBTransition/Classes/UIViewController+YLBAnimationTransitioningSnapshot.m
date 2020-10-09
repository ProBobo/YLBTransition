//
//  UIViewController+YLBAnimationTransitioningSnapshot.m
//  Pods-YLBTransition_Example
//
//  Created by yulibo on 2020/10/9.
//

#import "UIViewController+YLBAnimationTransitioningSnapshot.h"
#import <objc/runtime.h>

@implementation UIViewController (YLBAnimationTransitioningSnapshot)

- (UIView *)snapshot
{
    UIView *view = objc_getAssociatedObject(self, @"YLBAnimationTransitioningSnapshot");
    if (!view)
    {
        view = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
        [self setSnapshot:view];
    }
    return view;
}

- (void)setSnapshot:(UIView *)snapshot
{
    objc_setAssociatedObject(self, @"YLBAnimationTransitioningSnapshot", snapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)topSnapshot
{
    UIView *view = objc_getAssociatedObject(self, @"YLBAnimationTransitioningTopSnapshot");
    if(!view)
    {
        view = [self.navigationController.view resizableSnapshotViewFromRect:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 64) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
//        view = [self.navigationController.navigationBar snapshotViewAfterScreenUpdates:NO];
//        UIGraphicsBeginImageContext(CGSizeMake([[UIScreen mainScreen] bounds].size.width, 64));
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        [self.navigationController.navigationBar.layer renderInContext:context];
//        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        UIImageView *imgView = [[UIImageView alloc]initWithImage:theImage];
        
        [self setTopSnapshot:view];
    }
    return view;
}
- (void)setTopSnapshot:(UIView *)topSnapshot
{
    objc_setAssociatedObject(self, @"YLBAnimationTransitioningTopSnapshot", topSnapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)viewSnapshot
{
    UIView *view = objc_getAssociatedObject(self, @"YLBAnimationTransitioningViewSnapshot");
    if (!view)
    {
        view = [self.navigationController.view resizableSnapshotViewFromRect:CGRectMake(0, 64, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]) - 64) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
        [self setViewSnapshot:view];
    }
    return view;
}

- (void)setViewSnapshot:(UIView *)viewSnapshot
{
    objc_setAssociatedObject(self, @"YLBAnimationTransitioningViewSnapshot", viewSnapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
