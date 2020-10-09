//
//  UIViewController+YLBAnimationTransitioningSnapshot.h
//  Pods-YLBTransition_Example
//
//  Created by yulibo on 2020/10/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YLBAnimationTransitioningSnapshot)
/**
 *屏幕快照
 */
@property (nonatomic, strong) UIView *snapshot;

@property(nonatomic,strong)UIView *topSnapshot;

@property(nonatomic,strong)UIView *viewSnapshot;

@end

NS_ASSUME_NONNULL_END
