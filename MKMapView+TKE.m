//
//  MKMapView+TKE.m
//  EMTE
//
//  Created by Taras Kalapun on 30/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import "MKMapView+TKE.h"

@implementation MKMapView (TKE)

- (UIButton *)tke_locationButon {
    return (id)[self viewWithTag:1007];
}

- (void)tke_showLocationButon
{
    MKUserTrackingBarButtonItem *locationBtn = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self];
    if (!locationBtn.customView || ![locationBtn.customView isKindOfClass:[UIButton class]]) {
        return;
    }
    
    if ([self viewWithTag:1007]) {
        return;
    }
    
    UIButton *v = (id)locationBtn.customView;
    v.layer.borderColor = self.tintColor.CGColor;
    v.layer.borderWidth = 1.0;
    v.layer.cornerRadius = 5;
    v.layer.masksToBounds = YES;
    v.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    
//    CGRect rect = v.frame;
//    rect.origin.x = CGRectGetMaxX(self.bounds) - rect.size.width  - 10;
//    rect.origin.y = CGRectGetMaxY(self.bounds) - rect.size.height - 120;
//    //rect.origin.x = 20;
//    //rect.origin.y = 20;
//    v.frame = rect;
    v.tag = 1007;
    
//    self.translatesAutoresizingMaskIntoConstraints = NO;
    v.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:v];
    
    [self addFormattedConstraints:@[@"H:[btn(30)]-8.0-|", @"V:[btn(30)]-8.0-|"] forViews:@{@"btn":v}];
}

- (void)zoomToAnnotationsAnimated:(BOOL)animated {
    if (self.annotations.count == 0) {
        return;
    }
    
    NSMutableArray *anns = @[].mutableCopy;
    for (id ann in self.annotations) {
        if (![ann isKindOfClass:[MKUserLocation class]]) {
            [anns addObject:ann];
        }
    }
    
    [self showAnnotations:anns animated:YES];
}

@end
