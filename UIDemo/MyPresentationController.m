//
//  MyPresentationController.m
//  UIDemo
//
//  Created by Hao Chen on 2017/2/26.
//  Copyright © 2017年 Hao Chen. All rights reserved.
//

#import "MyPresentationController.h"

@interface MyPresentationController ()
@property (nonatomic)  UIView *dimView;
@property (nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation MyPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        self.dimView = [UIView new];
        self.dimView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
        self.dimView.alpha = 0.0f;
        self.dimView.translatesAutoresizingMaskIntoConstraints=NO;
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self.dimView addGestureRecognizer:self.tapGestureRecognizer];
    }
    
    return self;
}

- (void)dealloc
{
    [self.dimView removeGestureRecognizer:self.tapGestureRecognizer];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentationTransitionWillBegin
{
    [self.containerView insertSubview:self.dimView atIndex:0];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[DV]|" options:0 metrics:nil views:@{@"DV": self.dimView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[DV]|" options:0 metrics:nil views:@{@"DV": self.dimView}]];
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimView.alpha = 1.0f;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin
{
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimView.alpha = 0.0f;
    } completion:nil];
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect frame = CGRectMake(0, 0.25*CGRectGetHeight(self.containerView.frame), CGRectGetWidth(self.containerView.frame), 0.75*CGRectGetHeight(self.containerView.frame));
    return frame;
}


@end
