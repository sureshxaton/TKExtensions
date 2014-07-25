//
//  TKActivityMaps.h
//  EMTE
//
//  Created by Taras Kalapun on 05/06/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapItem;
@interface TKActivityMaps : UIActivity
@property (nonatomic, strong) NSDictionary *launchOptions;
@property (nonatomic, strong) MKMapItem *mapItem;
@property (nonatomic, strong) NSString *addressLine;

@end
