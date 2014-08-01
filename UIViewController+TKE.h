//
//  UIViewController+TKE.h
//  EMTE
//
//  Created by Taras Kalapun on 30/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TKE)

- (void)presentAutoModalViewController:(UIViewController *)viewController;
- (UIBarButtonItem *)autoModalViewControllerDismissButton;
- (void)autoModalViewControllerDismiss:(id)sender;
- (BOOL)isAutoModalViewController;

@end
