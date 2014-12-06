//
//  NavigationControllerDelegate.m
//  NavigationTransDemo
//
//  Created by 杨启晖 on 14/12/6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "NavigationAnimation.h"

@implementation NavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[NavigationAnimation alloc]init];
    }
    return nil;
}
@end
