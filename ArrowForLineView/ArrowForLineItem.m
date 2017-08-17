//
//  ArrowForLineItem.m
//  NSJSONSerializationDemo
//
//  Created by sungrow on 2017/8/17.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "ArrowForLineItem.h"
#import "ArrowForLineView.h"

@interface ArrowForLineItem ()

@property (nonatomic, strong) ArrowForLineView *arrowForLineV;

@end

@implementation ArrowForLineItem

- (instancetype)initWithArrowForLineOrientationType:(ArrowForLineOrientationType)orientationType clockwise:(bool)isClockwise {
    if (self = [super init]) {
        self.orientationType = orientationType;
        self.clockwise = isClockwise;
        [self createItem];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        self.orientationType = ArrowForLineOrientationTypeTopLeft;
        self.clockwise = YES;
        [self createItem];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createItem];
    self.orientationType = ArrowForLineOrientationTypeTopLeft;
    self.clockwise = YES;
}

- (void)createItem {
    self.clipsToBounds = YES;
    NSString *lineImageName = @"line_topLeft";
    NSString *arrowImageName = @"arrow_left";

    switch (self.orientationType) {
        case ArrowForLineOrientationTypeTopLeft:
            lineImageName = @"line_topLeft";
            arrowImageName = @"arrow_left";
            break;
        case ArrowForLineOrientationTypeTopRight:
            lineImageName = @"line_topRight";
            arrowImageName = @"arrow_left";
            break;
        case ArrowForLineOrientationTypeBottomLeft:
            lineImageName = @"line_bottomLeft";
            arrowImageName = @"arrow_left";
            break;
        case ArrowForLineOrientationTypeBottomRight:
            lineImageName = @"line_bottomRight";
            arrowImageName = @"arrow_left";
            break;
        default:
            break;
    }
    UIImage *lineImage = [UIImage imageNamed:lineImageName];
    UIImage *arrowImage = [UIImage imageNamed:arrowImageName];
    
    CGFloat maxX = lineImage.size.width - arrowImage.size.width * 0.5 - 1;
    CGFloat maxY = lineImage.size.height - arrowImage.size.height * 0.5 + 1;
    CGFloat minX = arrowImage.size.width * 0.5;
    CGFloat minY = arrowImage.size.height * 0.5;
    
    switch (self.orientationType) {
        case ArrowForLineOrientationTypeTopLeft:
            maxX = lineImage.size.width + arrowImage.size.width;
            maxY = lineImage.size.height + arrowImage.size.height;
            minX = arrowImage.size.width * 0.5;
            minY = arrowImage.size.height * 0.5;
            break;
        case ArrowForLineOrientationTypeTopRight:
            maxX = lineImage.size.width - arrowImage.size.width * 0.5 - 1;
            maxY = lineImage.size.height + arrowImage.size.height;
            minX = -arrowImage.size.width;
            minY = arrowImage.size.height * 0.5;
            break;
        case ArrowForLineOrientationTypeBottomLeft:
            maxX = lineImage.size.width + arrowImage.size.width;
            maxY = lineImage.size.height - arrowImage.size.height * 0.5;
            minX = arrowImage.size.width * 0.5 + 1;
            minY = -arrowImage.size.height;
            break;
        case ArrowForLineOrientationTypeBottomRight:
            maxX = lineImage.size.width - arrowImage.size.width * 0.5 - 1;
            maxY = lineImage.size.height - arrowImage.size.height * 0.5;
            minX = -arrowImage.size.width;
            minY = -arrowImage.size.height;
            break;
        default:
            break;
    }
    
    CGPoint leftTopP = CGPointMake(minX, minY);
    CGPoint leftBottomP = CGPointMake(minX, maxY);
    CGPoint rightTopP = CGPointMake(maxX, minY);
    CGPoint rightBottomP = CGPointMake(maxX, maxY);
    
    NSArray *points = @[];
    switch (self.orientationType) {
        case ArrowForLineOrientationTypeTopLeft:
            if (self.isClockwise) {
                points = @[[NSValue valueWithCGPoint:leftBottomP], [NSValue valueWithCGPoint:leftTopP], [NSValue valueWithCGPoint:rightTopP]];
            } else {
                points = @[[NSValue valueWithCGPoint:rightTopP], [NSValue valueWithCGPoint:leftTopP], [NSValue valueWithCGPoint:leftBottomP]];
            }
            break;
        case ArrowForLineOrientationTypeTopRight:
            if (self.isClockwise) {
                points = @[[NSValue valueWithCGPoint:leftTopP], [NSValue valueWithCGPoint:rightTopP], [NSValue valueWithCGPoint:rightBottomP]];
            } else {
                points = @[[NSValue valueWithCGPoint:rightBottomP], [NSValue valueWithCGPoint:rightTopP], [NSValue valueWithCGPoint:leftTopP]];
            }
            break;
        case ArrowForLineOrientationTypeBottomLeft:
            if (self.isClockwise) {
                points = @[[NSValue valueWithCGPoint:rightBottomP], [NSValue valueWithCGPoint:leftBottomP], [NSValue valueWithCGPoint:leftTopP]];
            } else {
                points = @[[NSValue valueWithCGPoint:leftTopP], [NSValue valueWithCGPoint:leftBottomP], [NSValue valueWithCGPoint:rightBottomP]];
            }
            break;
        case ArrowForLineOrientationTypeBottomRight:
            if (self.isClockwise) {
                points = @[[NSValue valueWithCGPoint:rightTopP], [NSValue valueWithCGPoint:rightBottomP], [NSValue valueWithCGPoint:leftBottomP]];
            } else {
                points = @[[NSValue valueWithCGPoint:leftBottomP], [NSValue valueWithCGPoint:rightBottomP], [NSValue valueWithCGPoint:rightTopP]];
            }
            break;
        default:
            break;
    }
    self.arrowForLineV = [[ArrowForLineView alloc] initWithPoints:points lineImage:lineImage arrowImage:arrowImage];
    [self addSubview:self.arrowForLineV];
    self.bounds = self.arrowForLineV.frame;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
