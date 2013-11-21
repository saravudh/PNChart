//
//  PNStackedBar.m
//  Quarter
//
//  Created by Saravudh Sinsomros on 11/14/2556 BE.
//  Copyright (c) 2556 APPSTACK. All rights reserved.
//

#import "PNStackedBar.h"
#import "PNColor.h"

@interface PNStackedBar()

@property (nonatomic, strong) NSMutableArray *grades;
@property (nonatomic, strong) NSMutableArray *barColors;

@end

@implementation PNStackedBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		_chartLine = [CAShapeLayer layer];
		_chartLine.lineCap = kCALineCapSquare;
		_chartLine.fillColor   = [[UIColor whiteColor] CGColor];
		_chartLine.lineWidth   = self.frame.size.width;
		_chartLine.strokeEnd   = 0.0;
		self.clipsToBounds = YES;
		[self.layer addSublayer:_chartLine];
		self.layer.cornerRadius = 2.0;
        self.grades = [NSMutableArray array];
        self.barColors = [NSMutableArray array];
    }
    return self;
}

-(void) addGrades:(float) arg1, ...
{
    double eachObject;
    va_list argumentList;
    if (arg1) {
        [self.grades removeAllObjects];
        [self.grades addObject:[NSNumber numberWithFloat:arg1]];
        va_start(argumentList, arg1);
        while ((eachObject = va_arg(argumentList, double)))
        {
            [self.grades addObject:[NSNumber numberWithFloat:eachObject]];
        }
        va_end(argumentList);
        
        self.chartLine.sublayers = nil;
        float gradeAccumulator = 0.0;
        for (int i=0; i<self.barColors.count; i++) {
            float grade = [self.grades[i] floatValue];
            UIColor *color;
            if (self.barColors.count > i) {
                color = self.barColors[i];
            } else {
                color = PNBlue;
            }
            
            float gradeAccumulatorInFrameScale = gradeAccumulator * self.frame.size.height;
            float gradeInFrameScale = grade * self.frame.size.height;
            CGPoint fromPoint1 = CGPointMake(self.frame.size.width/2.0, self.frame.size.height - gradeAccumulatorInFrameScale);
            CGPoint toPoint1 = CGPointMake(self.frame.size.width/2.0, self.frame.size.height - gradeInFrameScale - gradeAccumulatorInFrameScale);

            CGColorRef color1 = [color CGColor];
            [self drawLineGraph:fromPoint1 toPoint:toPoint1 color:color1];
            gradeAccumulator += grade;
        }
    }
}

-(void) addColors:(UIColor *) arg1, ...
{
    id eachObject;
    va_list argumentList;
    if (arg1) {
        [self.barColors removeAllObjects];
        [self.barColors addObject: arg1];
        va_start(argumentList, arg1);
        while ((eachObject = va_arg(argumentList, id)))
        {
            [self.barColors addObject:eachObject];
        }
        va_end(argumentList);
    }
}

-(void) drawLineGraph:(CGPoint) fromPoint toPoint:(CGPoint) toPoint color:(CGColorRef) colorRef{
    UIBezierPath *progressline2 = [UIBezierPath bezierPath];
    
    [progressline2 moveToPoint:fromPoint];
	[progressline2 addLineToPoint:toPoint];
    
    [progressline2 setLineWidth:1.0];
    [progressline2 setLineCapStyle:kCGLineCapSquare];
    
    
	CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.lineWidth   = self.frame.size.width;
    [shapeLayer1 setPath:progressline2.CGPath];
    [self.chartLine addSublayer:shapeLayer1];
    
    shapeLayer1.strokeColor = colorRef;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    [shapeLayer1 addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    shapeLayer1.strokeEnd = 1.0;
}

@end
