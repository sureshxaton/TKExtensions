//
//  MKMapView+TKE.h
//  EMTE
//
//  Created by Taras Kalapun on 30/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (TKE)

- (void)tke_showLocationButon;
- (UIButton *)tke_locationButon;

- (void)zoomToAnnotationsAnimated:(BOOL)animated;

@end
