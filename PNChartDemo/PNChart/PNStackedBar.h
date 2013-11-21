//
//  PNStackedBar.h
//  Quarter
//
//  Created by Saravudh Sinsomros on 11/14/2556 BE.
//  Copyright (c) 2556 APPSTACK. All rights reserved.
//

#import "PNBar.h"

@interface PNStackedBar : UIView

@property (nonatomic, strong) CAShapeLayer *chartLine;

-(void) addGrades:(float) grade2, ...;
-(void) addColors:(UIColor *) arg1, ...;

@end
