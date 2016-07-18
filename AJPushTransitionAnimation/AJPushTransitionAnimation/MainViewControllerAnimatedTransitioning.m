//
//  MainViewControllerAnimatedTransitioning.m
//  AJPushTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/23.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import "MainViewControllerAnimatedTransitioning.h"
#import "MainCell.h"
#import "ViewController.h"
#import "SecondViewController.h"

@implementation MainViewControllerAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    return 0.6;

}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    SecondViewController *toVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *fromVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    MainCell *cell =(MainCell *)[fromVC.mainTableView cellForRowAtIndexPath:[fromVC.mainTableView indexPathForSelectedRow]];
    fromVC.indexPath = [fromVC.mainTableView indexPathForSelectedRow];
    
    
    UIView * snapShotView = [cell.mainImageView snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = fromVC.finalCellRect = [containerView convertRect:cell.mainImageView.frame fromView:cell.mainImageView.superview];
    snapShotView.alpha = 1;
    cell.mainImageView.hidden = YES;
    
    //设置第二个控制器的位置、透明度、
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.headImageView.hidden = YES;
    
    //把动画前后的两个ViewController加到容器中
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    

    
    [UIView animateWithDuration:0.6f animations:^{
        [containerView layoutIfNeeded];
        snapShotView.frame = [containerView convertRect:toVC.headImageView.frame fromView:toVC.view];
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        toVC.headImageView.hidden = NO;
        cell.mainImageView.hidden = NO;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
    //告诉系统动画结束
//    [transitionContext completeTransition:!transitionContext.transitionWasCancelled];

}


@end
