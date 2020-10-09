//
//  YLBBaseViewController.h
//  Pods-YLBTransition_Example
//
//  Created by yulibo on 2020/10/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBBaseViewController : UIViewController
@property(nonatomic,strong,readonly)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

NS_ASSUME_NONNULL_END
