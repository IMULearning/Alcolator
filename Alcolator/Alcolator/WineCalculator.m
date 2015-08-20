//
//  WineCalculator.m
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "WineCalculator.h"

@implementation WineCalculator

- (instancetype)init {
    self =  [super init];
    
    if (self) {
        _ouncePerContainer = 5;
        _concentration = 0.13;
    }
    
    return self;
}

- (AlcoholCalculation *) calculateWithConcentration: (CGFloat) concentration
                               AndOuncePerContainer: (CGFloat) ounces
                               AndNumberOfContainer: (NSInteger) number {
    CGFloat totalAlcoholInOunce = concentration * ounces * number;
    CGFloat numberOfWine = totalAlcoholInOunce / (self.ouncePerContainer * self.concentration);
    
    AlcoholCalculation *calculation = [AlcoholCalculation new];
    calculation.numberOfContainer = numberOfWine;
    calculation.alcoholText = (numberOfWine == 1) ? NSLocalizedString(@"glass", @"singular glass") : NSLocalizedString(@"glasses", @"plural of glass");
    
    return calculation;
}

@end
