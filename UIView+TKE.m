//
//  UIView+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 28/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "UIView+TKE.h"
#import <objc/runtime.h>

@implementation UIView (TKE)

- (void)addFormattedConstraints:(NSArray *)formattedConstraints forViews:(NSDictionary *)views
{
    NSMutableArray *constraints = [NSMutableArray array];
    for (NSString *sc in formattedConstraints) {
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:sc options:0 metrics:nil views:views]];
    }
    [self addConstraints:constraints];
}

- (void)sizeToFitWidthNicely {
    [self sizeToFit];
    CGRect rect = self.frame;
    
    CGFloat maxW = 290;
    CGFloat padding = 20;
    CGFloat padding2 = 40;
    
    CGFloat superW = self.superview.bounds.size.width;
    rect.origin.x = padding;
    rect.size.width = superW - padding2;

    if (rect.size.width > maxW) {
        rect.size.width = maxW;
    }
    
    self.frame = rect;

}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

@end
