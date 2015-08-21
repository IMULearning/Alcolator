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
    self.navigationItemTextBase = @"Whiskey";
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    AlcoholCalculation *result = [super doCalculate];
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@.", nil), [super getNumberOfContainers], [super getBeerString],  [self.beerPercentTextField.text floatValue], result.numberOfContainer, result.alcoholText];
    self.resultLabel.text = resultText;
}

@end
