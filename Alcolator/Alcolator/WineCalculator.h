//
//  WineCalculator.h
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlcoholCalculator.h"

@interface WineCalculator : NSObject <AlcoholCalculator>

@property (assign, readonly) CGFloat ouncePerContainer;
@property (assign, readonly) CGFloat concentration;

@end
