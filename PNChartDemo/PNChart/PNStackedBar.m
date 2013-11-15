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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		_chartLine2 = [CAShapeLayer layer];
		_chartLine2.lineCap = kCALineCapSquare;
		_chartLine2.fillColor   = [[UIColor whiteColor] CGColor];
		_chartLine2.lineWidth   = self.frame.size.width;
		_chartLine2.strokeEnd   = 0.0;
		self.clipsToBounds = YES;
		[self.layer addSublayer:_chartLine2];
		self.layer.cornerRadius = 2.0;
    }
    return self;
}

-(void)setGrade2:(float)grade2
{
	_grade2 = grade2;
	UIBezierPath *progressline = [UIBezierPath bezierPath];
    
    float edgeOfGrade1 = (1 - self.grade) * self.frame.size.height;
    float heightOfGrade2 = self.frame.size.height - ((1 - grade2) * self.frame.size.height);
    
//    NSLog(@"draw2 : %f -> %f", edgeOfGrade1, edgeOfGrade1 - heightOfGrade2);
    [progressline moveToPoint:CGPointMake(self.frame.size.width/2.0, 30.0)];
	[progressline addLineToPoint:CGPointMake(self.frame.size.width/2.0, 0.0)];
    
//    [progressline moveToPoint:CGPointMake(self.frame.size.width/2.0, edgeOfGrade1)];
//	[progressline addLineToPoint:CGPointMake(self.frame.size.width/2.0, edgeOfGrade1 - heightOfGrade2)];

    [progressline setLineWidth:1.0];
    [progressline setLineCapStyle:kCGLineCapSquare];
	_chartLine2.path = progressline.CGPath;
    
	if (_barColor2) {
		_chartLine2.strokeColor = [_barColor2 CGColor];
	}else{
		_chartLine2.strokeColor = [PNDarkYellow CGColor];
	}
    
//    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation.duration = 1.0;
//    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    pathAnimation.autoreverses = NO;
//    [_chartLine2 addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
//    
//    _chartLine2.strokeEnd = 1.0;
}

@end
