//
//  ViewController.m
//  NavigationTransDemo
//
//  Created by 杨启晖 on 14/12/6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "ViewController.h"
#import "NavigationAnimation.h"

@interface ViewController ()
@property (strong, nonatomic) NavigationAnimation* animator;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"viewController";
    
    //IOS7 api动画
    //[self catransition];
    
    //自定义动画
    [self customTrans];
}
#pragma mark -
#pragma mark CATransition
- (void)catransition{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(push)];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(pop)];
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:swipe];
}
- (void)push{
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.5;
    transition.type = kCATransitionReveal;
    
    ViewController *destination = [[ViewController alloc]initWithNibName:nil bundle:nil];
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:destination animated:NO];
}
- (void)pop{
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.5;
    transition.type = kCATransitionReveal;
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark -
#pragma mark CustomTrans
- (void)customTrans{
    self.animator = [[NavigationAnimation alloc]init];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    
    button.center = self.view.center;
    
    button.backgroundColor = [UIColor blackColor];
    
    [button setTitle:@"PUSH" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(customPush) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}
-(void)customPush{
    self.navigationController.delegate = self;
    ViewController *destination = [[ViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:destination animated:YES];
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.animator;
    }
    return nil;
}
@end
