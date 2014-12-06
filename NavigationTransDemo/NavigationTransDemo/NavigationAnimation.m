//
//  NavigationAnimation.m
//  NavigationTransDemo
//
//  Created by 杨启晖 on 14/12/6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "NavigationAnimation.h"

@implementation NavigationAnimation

// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView]addSubview:toController.view];
    toController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}
@end
