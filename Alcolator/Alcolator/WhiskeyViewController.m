//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "WhiskeyViewController.h"
#import "WhiskeyCalculator.h"

@interface WhiskeyViewController ()

@property (strong, nonatomic) WhiskeyCalculator *calculator;

@end

@implementation WhiskeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calculator = [WhiskeyCalculator new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    NSInteger numberOfBeers = self.beerCountSlider.value;
    NSInteger ouncesInOneBeerGlass = 12;
    CGFloat alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100.0;
    
    AlcoholCalculation *result = [self.calculator calculateWithConcentration:alcoholPercentageOfBeer AndOuncePerContainer:ouncesInOneBeerGlass AndNumberOfContainer:numberOfBeers];
    
    NSString *beerText = (numberOfBeers == 1) ? NSLocalizedString(@"beer", @"singular beer") : NSLocalizedString(@"beers", @"plural of beer");
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@.", nil), numberOfBeers, beerText,  [self.beerPercentTextField.text floatValue], result.numberOfContainer, result.alcoholText];
    self.resultLabel.text = resultText;
}

@end
