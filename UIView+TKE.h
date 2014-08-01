//
//  UIView+TKE.h
//  EMTE
//
//  Created by Taras Kalapun on 28/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TKE)

@property (nonatomic, readwrite, unsafe_unretained) IBOutlet NSLayoutConstraint *PWHidingConstraint;

- (void)addFormattedConstraints:(NSArray *)formattedConstraints forViews:(NSDictionary *)views;

- (void)sizeToFitWidthNicely;


- (void)setCornerRadius:(CGFloat)cornerRadius UI_APPEARANCE_SELECTOR;
- (void)setBorderColor:(UIColor *)borderColor UI_APPEARANCE_SELECTOR;
- (void)setBorderWidth:(CGFloat)borderWidth UI_APPEARANCE_SELECTOR;


@end
