//
//  WhiskeyCalculator.m
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "WhiskeyCalculator.h"

@implementation WhiskeyCalculator

- (instancetype)init {
    self =  [super init];
    
    if (self) {
        _ouncePerContainer = 1;
        _concentration = 0.4;
    }
    
    return self;
}

- (AlcoholCalculation *) calculateWithConcentration: (CGFloat) concentration
                               AndOuncePerContainer: (CGFloat) ounces
                               AndNumberOfContainer: (NSInteger) number {
    CGFloat totalAlcoholInOunce = concentration * ounces * number;
    CGFloat numberOfWhiskey = totalAlcoholInOunce / (self.ouncePerContainer * self.concentration);
    
    AlcoholCalculation *calculation = [AlcoholCalculation new];
    calculation.numberOfContainer = numberOfWhiskey;
    calculation.alcoholText = (numberOfWhiskey == 1) ? NSLocalizedString(@"shot of whiskey", @"singular shot") : NSLocalizedString(@"shots of whiskey", @"plural of shot");
    
    return calculation;
}

@end
