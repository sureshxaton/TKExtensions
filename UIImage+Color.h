//
//  UIImage+Color.h
//  EMTE
//
//  Created by Taras Kalapun on 24/07/14.
//  Copyright (c) 2014 Xaton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (instancetype)imageWithColor:(UIColor *)color;
+ (instancetype)imageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

@end
