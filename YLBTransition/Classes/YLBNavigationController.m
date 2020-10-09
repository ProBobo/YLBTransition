//
//  YLBNavigationController.m
//  Pods-YLBTransition_Example
//
//  Created by yulibo on 2020/10/9.
//

#import "YLBNavigationController.h"
#import "YLBBaseAnimation.h"
#import "YLBBaseViewController.h"

@interface YLBNavigationController ()<UINavigationControllerDelegate>

@end

@implementation YLBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(YLBBaseAnimation*) animationControlle {
//    YLBBackPriorViewAniamtion *animation = [[YLBBackPriorViewAniamtion alloc] init];
    return animationControlle.interactivePopTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(YLBBaseViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
//    YLBBaseAnimation *animation = [[YLBBaseAnimation alloc] init];
    if (fromVC.interactivePopTransition) {
        YLBBaseAnimation *animation = [[YLBBaseAnimation alloc] initWithType:operation Duration:0.6 animateType:self.animationType];
        animation.interactivePopTransition = fromVC.interactivePopTransition;
        return animation; //手势
    }
    else {
        YLBBaseAnimation *animation = [[YLBBaseAnimation alloc] initWithType:operation Duration:0.6 animateType:self.animationType];
        return animation;//非手势
    }
    
    
}

@end
