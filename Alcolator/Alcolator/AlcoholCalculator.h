//
//  AlcoholCalculator.h
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AlcoholCalculation.h"

@protocol AlcoholCalculator <NSObject>

- (AlcoholCalculation *) calculateWithConcentration: (CGFloat) concentration
                               AndOuncePerContainer: (CGFloat) ounces
                               AndNumberOfContainer: (NSInteger) number;

@end
