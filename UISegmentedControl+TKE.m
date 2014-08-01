//
//  UISegmentedControl+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 30/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "UISegmentedControl+TKE.h"

@implementation UISegmentedControl (TKE)

- (UILabel *)labelForIndex:(NSInteger)index
{
    if (index > self.subviews.count-1) {
        return nil;
    }
    
    UIView *segment = self.subviews[index];
    for (UIView *v in segment.subviews) {
        if ([v isKindOfClass:[UILabel class]]) {
            return (id)v;
        }
    }
    
    return nil;
}

@end
