//
//  PNStackedBarChart.h
//  Quarter
//
//  Created by Saravudh Sinsomros on 11/14/2556 BE.
//  Copyright (c) 2556 APPSTACK. All rights reserved.
//

#import "PNBarChart.h"

@interface PNStackedBarChart : PNBarChart

@property (strong, nonatomic) NSArray * yValues2;

-(void)setYValues:(NSArray *)yValues yValues2:(NSArray *)yValues2;

@end
