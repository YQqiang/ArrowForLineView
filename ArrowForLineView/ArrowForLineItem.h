//
//  ArrowForLineItem.h
//  NSJSONSerializationDemo
//
//  Created by sungrow on 2017/8/17.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "ArrowForLineView.h"

typedef enum : NSUInteger {
    ArrowForLineOrientationTypeTopLeft,
    ArrowForLineOrientationTypeTopRight,
    ArrowForLineOrientationTypeBottomLeft,
    ArrowForLineOrientationTypeBottomRight,
} ArrowForLineOrientationType;

@interface ArrowForLineItem : UIView

@property (nonatomic, assign) ArrowForLineOrientationType orientationType;
@property (nonatomic, assign, getter=isClockwise) bool clockwise;

- (instancetype)initWithArrowForLineOrientationType:(ArrowForLineOrientationType)orientationType clockwise:(bool)isClockwise;

@end
