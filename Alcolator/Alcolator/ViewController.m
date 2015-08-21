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
@property (assign) NSInteger ouncesInOneBeerGlass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ouncesInOneBeerGlass = 12;
    self.navigationItemTextBase = @"Wine";
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
    [self.beerPercentTextField resignFirstResponder];
    
    if ([self getNumberOfContainers] <= 0) {
        return;
    }
    
    AlcoholCalculation *result = [self doCalculate];
    NSString *appendText = [NSString stringWithFormat:@" (%.1f of %@)", result.numberOfContainer, result.containerText];
    self.navigationItem.title = [self.navigationItemTextBase stringByAppendingString:appendText];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    AlcoholCalculation *result = [self doCalculate];
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@.", nil), [self getNumberOfContainers], [self getBeerString],  [self.beerPercentTextField.text floatValue], result.numberOfContainer, result.alcoholText];
    self.resultLabel.text = resultText;
}

- (AlcoholCalculation *) doCalculate {
    return [self.calculator calculateWithConcentration:[self getConcentration] AndOuncePerContainer:self.ouncesInOneBeerGlass AndNumberOfContainer:[self getNumberOfContainers]];
}

- (NSInteger) getNumberOfContainers {
    return self.beerCountSlider.value;
}

- (CGFloat) getConcentration {
    return [self.beerPercentTextField.text floatValue] / 100.0;
}

- (NSString *) getBeerString {
    return ([self getNumberOfContainers] == 1) ? NSLocalizedString(@"beer", @"singular beer") : NSLocalizedString(@"beers", @"plural of beer");
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
