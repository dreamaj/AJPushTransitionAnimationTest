//
//  SecondViewControllerAnimatedTransitioning.m
//  AJPushTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/23.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import "SecondViewControllerAnimatedTransitioning.h"
#import "SecondViewController.h"
#import "ViewController.h"
#import "MainCell.h"

@implementation SecondViewControllerAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    return 0.6f;

}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    SecondViewController *fromVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    //在前一个VC上创建一个截图
    UIView  *snapShotView = [fromVC.headImageView snapshotViewAfterScreenUpdates:NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    snapShotView.frame = [containerView convertRect:fromVC.headImageView.frame fromView:fromVC.headImageView.superview];
    fromVC.headImageView.hidden = YES;
    
    //初始化后一个VC的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    
    //获取toVC中图片的位置
    MainCell *cell = (MainCell *)[toVC.mainTableView cellForRowAtIndexPath:toVC.indexPath];
    cell.mainImageView.hidden = YES;

    //顺序很重要，
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapShotView];
    
    //发生动画
    [UIView animateWithDuration:0.6f animations:^{
        fromVC.view.alpha = 0.0f;
        snapShotView.frame = toVC.finalCellRect;
    } completion:^(BOOL finished) {
        [snapShotView removeFromSuperview];
        fromVC.headImageView.hidden = NO;
        cell.mainImageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    

}

@end
