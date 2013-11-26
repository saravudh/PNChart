//
//  PNStackedBarChart.m
//  Quarter
//
//  Created by Saravudh Sinsomros on 11/14/2556 BE.
//  Copyright (c) 2556 APPSTACK. All rights reserved.
//

#import "PNStackedBarChart.h"
#import "PNStackedBar.h"
#import "PNColor.h"
#import "PNChartLabel.h"

@interface PNStackedBarChart()
-(void)setYLabels:(NSArray *)yLabels yLabels2:(NSArray *)yLabels2;
@end

@implementation PNStackedBarChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        
    }
    
    return self;
}

-(void)setYValues:(NSArray *)yValues yValues2:(NSArray *)yValues2
{
    self.yValues = yValues;
    self.yValues2 = yValues2;
    [self setYLabels:yValues yLabels2:yValues2];
}

-(void)setYLabels:(NSArray *)yLabels yLabels2:(NSArray *)yLabels2
{
    NSInteger max = 0;
    for (int i=0; i<yLabels.count; i++) {
        NSInteger value = [yLabels[i] integerValue];
        NSInteger value2 = [yLabels2[i] integerValue];
        NSInteger valueSummary = value + value2;
        if (valueSummary > max) {
            max = valueSummary;
        }
    }
    
    //Min value for Y label
    NSInteger minYValue = 5;
    if (max < minYValue) {
        max = minYValue;
    }
    
    self.yValueMax = (int)max;
    
    NSLog(@"Y Max is %d", self.yValueMax );
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
	_strokeColor = strokeColor;
}

-(void)setXLabels:(NSArray *)xLabels
{
    float numberOfChartPerPage = 12.0;
    _xLabels = xLabels;
    _xLabelWidth = (self.frame.size.width - chartMargin*2)/numberOfChartPerPage;
    
    for (NSString * labelText in xLabels) {
        NSInteger index = [xLabels indexOfObject:labelText];
        PNChartLabel * label = [[PNChartLabel alloc] initWithFrame:CGRectMake((index *  _xLabelWidth + chartMargin), self.frame.size.height - 30.0, _xLabelWidth, 20.0)];
        [label setTextAlignment:NSTextAlignmentCenter];
        label.text = labelText;
        [self addSubview:label];
    }
}

-(void)strokeChart
{
    CGFloat chartCavanHeight = self.frame.size.height - chartMargin * 2 - 40.0;
    for (int i=0; i<self.yValues.count; i++) {
        float value = [self.yValues[i] floatValue];
        float value2 = [self.yValues2[i] floatValue];
        
        float grade = (float)value / (float)self.yValueMax;
        float grade2 = (float)value2 / (float)self.yValueMax;
		
        float x = (i *  self.xLabelWidth + chartMargin + self.xLabelWidth * 0.25);
        float y = self.frame.size.height - chartCavanHeight - 30.0;
        float width = self.xLabelWidth * 0.5;
        float height = chartCavanHeight;
        
		PNStackedBar * bar = [[PNStackedBar alloc] initWithFrame:CGRectMake(x, y, width, height)];
        [bar addColors:self.strokeColor, PNBlue, nil];
        [bar addGrades:grade, grade2, nil];
		[self addSubview:bar];
    }
}

@end
