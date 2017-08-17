//
//  ViewController.m
//  ArrowForLineViewDemo
//
//  Created by sungrow on 2017/8/17.
//  Copyright © 2017年 sungrow. All rights reserved.
//

#import "ViewController.h"
#import "ArrowForLineItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArrowForLineItem *arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeTopRight clockwise:YES];
    arrowLineItem.center = CGPointMake(60, 60);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeTopRight clockwise:NO];
    arrowLineItem.center = CGPointMake(240, 60);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeTopLeft clockwise:YES];
    arrowLineItem.center = CGPointMake(60, 200);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeTopLeft clockwise:NO];
    arrowLineItem.center = CGPointMake(240, 200);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeBottomLeft clockwise:YES];
    arrowLineItem.center = CGPointMake(60, 340);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeBottomLeft clockwise:NO];
    arrowLineItem.center = CGPointMake(240, 340);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeBottomRight clockwise:YES];
    arrowLineItem.center = CGPointMake(60, 480);
    [self.view addSubview:arrowLineItem];
    
    arrowLineItem = [[ArrowForLineItem alloc] initWithArrowForLineOrientationType:ArrowForLineOrientationTypeBottomRight clockwise:NO];
    arrowLineItem.center = CGPointMake(240, 480);
    [self.view addSubview:arrowLineItem];
}


@end
