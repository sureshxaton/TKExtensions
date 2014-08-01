//
//  UIViewController+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 30/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "UIViewController+TKE.h"

@implementation UIViewController (TKE)

- (void)presentAutoModalViewController:(UIViewController *)viewController
{
    UINavigationController *nc = nil;
    if (![viewController isKindOfClass:[UINavigationController class]]) {
        nc = [[UINavigationController alloc] initWithRootViewController:viewController];
    } else {
        nc = (UINavigationController *)viewController;
    }
    
    nc.modalPresentationStyle = UIModalPresentationFormSheet;
    //nc.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    UIViewController *vc = nc.viewControllers[0];
    
    UIBarButtonItem *closeBtn = [self autoModalViewControllerDismissButton];
    if (closeBtn)
        vc.navigationItem.rightBarButtonItem = closeBtn;
    
    [self presentViewController:nc animated:YES completion:nil];
}

- (UIBarButtonItem *)autoModalViewControllerDismissButton {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(autoModalViewControllerDismiss:)];
}

- (void)autoModalViewControllerDismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)isAutoModalViewController
{
    return (self.navigationController != nil &&
            self.navigationController.parentViewController != nil &&
            self.navigationController.parentViewController.presentedViewController == self.navigationController);
}


@end
