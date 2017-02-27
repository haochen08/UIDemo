//
//  ViewController.m
//  UIDemo
//
//  Created by Hao Chen on 16/8/22.
//  Copyright © 2016年 Hao Chen. All rights reserved.
//

#import "ViewController.h"
#import "MyPresentationController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[MyPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"popoverSegue"]) {
        UIViewController *vc = segue.destinationViewController;
        vc.modalPresentationStyle = UIModalPresentationCustom;
        vc.transitioningDelegate = self;

        

    }
    
}

@end
