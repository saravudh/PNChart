//
//  PNStackedBarChart.h
//  Quarter
//
//  Created by Saravudh Sinsomros on 11/14/2556 BE.
//  Copyright (c) 2556 APPSTACK. All rights reserved.
//

#import <UIKit/UIKit.h>
#define chartMargin     10
#define xLabelMargin    15
#define yLabelMargin    15
#define yLabelHeight    11

@interface PNStackedBarChart : UIView

@property (strong, nonatomic) NSArray * yValues2;
@property (strong, nonatomic) NSArray * xLabels;
@property (strong, nonatomic) NSArray * yLabels;
@property (strong, nonatomic) NSArray * yValues;
@property (nonatomic) CGFloat xLabelWidth;
@property (nonatomic) int yValueMax;
@property (nonatomic, strong) UIColor * strokeColor;

-(void)setYValues:(NSArray *)yValues yValues2:(NSArray *)yValues2;
-(void)strokeChart;

@end
