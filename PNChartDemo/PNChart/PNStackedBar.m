//
//  PNStackedBar.m
//  Quarter
//
//  Created by Saravudh Sinsomros on 11/14/2556 BE.
//  Copyright (c) 2556 APPSTACK. All rights reserved.
//

#import "PNStackedBar.h"
#import "PNColor.h"

@implementation PNStackedBar

-(void)setGrade:(float)grade grade2:(float)grade2
{
	self.grade = grade;
	UIBezierPath *progressline = [UIBezierPath bezierPath];
    
    [progressline moveToPoint:CGPointMake(self.frame.size.width/2.0, self.frame.size.height)];
	[progressline addLineToPoint:CGPointMake(self.frame.size.width/2.0, (1 - grade) * self.frame.size.height)];
	
    [progressline setLineWidth:1.0];
    [progressline setLineCapStyle:kCGLineCapSquare];
	self.chartLine.path = progressline.CGPath;
    
	if (self.barColor) {
		self.chartLine.strokeColor = [self.barColor CGColor];
	}else{
		self.chartLine.strokeColor = [PNGreen CGColor];
	}
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    [self.chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    self.chartLine.strokeEnd = 1.0;
}

@end
