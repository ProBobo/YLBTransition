//
//  YLBBaseAnimation.h
//  Pods-YLBTransition_Example
//
//  Created by yulibo on 2020/10/9.
//

#import <Foundation/Foundation.h>
#import "UIViewController+YLBAnimationTransitioningSnapshot.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,YLBAnimateType)
{
//    两个navigation背景不同
    YLBAnimateTypeDefault = 0,
    YLBAnimateTypeDiffNavi,
    YLBAnimateTypeKuGou,
    YLBAnimateTypeRound,
    YLBAnimateTypeOval,
    
};

@interface YLBBaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign,readonly)UINavigationControllerOperation transitionType;
@property(nonatomic,strong,readwrite)UIPercentDrivenInteractiveTransition *interactivePopTransition;

/**
 *  主要构造方法
 *  @param  transitionType      动画类型 push or pop
 *  @param  duration            间隔时间
 *  @param  animaType           动画方式
 */
- (instancetype)initWithType:(UINavigationControllerOperation)transitionType
                    Duration:(NSTimeInterval)duration
                 animateType:(YLBAnimateType)animaType;

/**
 *  创建实例对象
 *  @param  transitionType      动画类型 push or pop
 *  @param  animaType           动画方式
 */
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType
                       animateType:(YLBAnimateType)animaType;

/**
 *  创建实例对象
 *  @param  transitionType      动画类型 push or pop
 *  @param  duration            间隔时间
 *  @param  animaType           动画方式
 */
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType
                          duration:(NSTimeInterval)duration
                       animateType:(YLBAnimateType)animaType;
/**
 *  创建实例对象
 *  @param  transitionType      动画类型 push or pop
 *  @param  duration            间隔时间
 *  @param  interactivePopTransition            可交互属性
 *  @param  animaType           动画方式
 */
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType
                          duration:(NSTimeInterval)duration
          interactivePopTransition:(nullable UIPercentDrivenInteractiveTransition *)interactivePopTransition
                       animateType:(YLBAnimateType)animaType;

#pragma mark - push pop方法，具体交给子类实现
- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)pushEnded;
- (void)popEnded;

@end

NS_ASSUME_NONNULL_END
