//
//  YLBBaseAnimation.m
//  Pods-YLBTransition_Example
//
//  Created by yulibo on 2020/10/9.
//

#import "YLBBaseAnimation.h"
#import "YLBAnimationDefault.h"
#import "YLBAnimationDiffNavi.h"
#import "YLBAnimationKuGou.h"
#import "YLBAnimationRound.h"
#import "YLBAnimationOval.h"

const static NSTimeInterval DefauleAnimationDuration = 0.6;

@interface YLBBaseAnimation ()
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign,readwrite)UINavigationControllerOperation transitionType;
@end

@implementation YLBBaseAnimation

#pragma mark - 构造实例
//初始化：使用自定义动画时间
- (instancetype)initWithType:(UINavigationControllerOperation)transitionType Duration:(NSTimeInterval)duration animateType:(YLBAnimateType)animaType {
    switch (animaType)
    {
        case YLBAnimateTypeDefault:
        {
            self = [[YLBAnimationDefault alloc] init];
        }
            break;
        case YLBAnimateTypeDiffNavi:
        {
            self = [[YLBAnimationDiffNavi alloc] init];
        }
            break;
        case YLBAnimateTypeKuGou:
        {
            self = [[YLBAnimationKuGou alloc] init];
        }
            break;
        case YLBAnimateTypeRound:
        {
            self = [[YLBAnimationRound alloc] init];
        }
            break;
        case YLBAnimateTypeOval:
        {
            self = [[YLBAnimationOval alloc] init];
        }
            break;
            
        default:
            break;
    }
    
    if (self)
    {
        self.duration       = duration;
        self.transitionType = transitionType;
    }
    return self;
}
//使用默认动画时间
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType animateType:(YLBAnimateType)animaType {
    return [self transitionWithType:transitionType duration:DefauleAnimationDuration animateType:animaType];
}
//使用自定义动画时间、自定义转场类型为nil
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType duration:(NSTimeInterval)duration animateType:(YLBAnimateType)animaType {
    return [self transitionWithType:transitionType duration:duration interactivePopTransition:nil animateType:animaType];
}
//使用自定义动画时间、自定义转场类型
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType duration:(NSTimeInterval)duration interactivePopTransition:(nullable UIPercentDrivenInteractiveTransition *)interactivePopTransition animateType:(YLBAnimateType)animaType {
    YLBBaseAnimation *animation = [[self alloc] initWithType:transitionType Duration:duration animateType:animaType];
    animation.interactivePopTransition = interactivePopTransition;
    return animation;
}

#pragma mark - push pop方法，具体交给子类实现
- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext{}
- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext{}
- (void)pushEnded{}
- (void)popEnded{}

#pragma mark - UIViewControllerAnimatedTransitioning

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    if (self.transitionType == UINavigationControllerOperationPush) {
        [self push:transitionContext];
    }
    else if (self.transitionType == UINavigationControllerOperationPop) {
        [self pop:transitionContext];
    }
}

- (void)animationEnded:(BOOL)transitionCompleted {
    if (!transitionCompleted) {
        return;
    }
    if (self.transitionType == UINavigationControllerOperationPush) {
        [self pushEnded];
    }
    else if (self.transitionType == UINavigationControllerOperationPop) {
        [self popEnded];
    }
    
}

@end
