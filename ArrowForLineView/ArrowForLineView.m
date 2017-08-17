//
//  ArrowForLineView.m
//  NSJSONSerializationDemo
//
//  Created by sungrow on 2017/8/17.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "ArrowForLineView.h"


@interface ArrowForLineView ()

@property (nonatomic, strong) UIImageView *lineImageV;
@property (nonatomic, strong) UIImage *lineImage;

@property (nonatomic, strong) UIImageView *arrowImageV;
@property (nonatomic, strong) UIImage *arrowImage;

@property (nonatomic, strong) NSArray <NSValue *>*points;

@end

@implementation ArrowForLineView

- (instancetype)initWithPoints:(NSArray <NSValue *>*)points lineImage:(UIImage *)lineImage arrowImage:(UIImage *)arrowImage {
    if (self = [super init]) {
        self.lineImage = lineImage;
        self.arrowImage = arrowImage;
        self.points = points;
        [self createUI];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        self.lineImage = [UIImage imageNamed:@""];
        self.arrowImage = [UIImage imageNamed:@""];
        self.points = @[];
        [self createUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lineImage = [UIImage imageNamed:@""];
    self.arrowImage = [UIImage imageNamed:@""];
    self.points = @[];
    [self createUI];
}

- (void)createUI {
    
    self.lineImageV = [[UIImageView alloc] init];
    self.lineImageV.image = self.lineImage;
    [self.lineImageV sizeToFit];
    [self addSubview:self.lineImageV];
    self.bounds = self.lineImageV.bounds;
    
    self.arrowImageV = [[UIImageView alloc] init];
    self.arrowImageV.image = self.arrowImage;
    [self.arrowImageV sizeToFit];
    [self addSubview:self.arrowImageV];
    CGRect arrowImageVRect = self.arrowImageV.frame;
    arrowImageVRect.origin = CGPointMake(-CGRectGetWidth(self.arrowImageV.frame), 0);
    self.arrowImageV.frame = arrowImageVRect;
    
    if (self.points.count <= 1) return;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:[self.points.firstObject CGPointValue]];
    for (int i = 1;  i < self.points.count; i ++) {
        [bezierPath addLineToPoint:[self.points[i] CGPointValue]];
    }
    CAKeyframeAnimation *kfAnimation = [CAKeyframeAnimation animation];
    
    kfAnimation.keyPath  = @"position";
    
    kfAnimation.path = bezierPath.CGPath;
    
    kfAnimation.duration = 3;
    
    kfAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    
    //    kfAnimation.autoreverses = YES;
    
    kfAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    kfAnimation.removedOnCompletion = NO;
    
    kfAnimation.fillMode = kCAFillModeForwards;
    
    kfAnimation.repeatCount = MAXFLOAT;
    
    [self.arrowImageV.layer addAnimation:kfAnimation forKey:nil];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
