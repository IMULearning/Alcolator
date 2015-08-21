//
//  ViewController.m
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ViewController.h"
#import "AlcoholCalculator.h"
#import "AlcoholCalculation.h"
#import "WineCalculator.h"

@interface ViewController ()

@property (strong, nonatomic) WineCalculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calculator = [WineCalculator new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    CGFloat enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%ld", (NSInteger) sender.value]];
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

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
