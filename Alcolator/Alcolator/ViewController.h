//
//  ViewController.h
//  Alcolator
//
//  Created by Weinan Qiu on 2015-08-20.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)buttonPressed:(UIButton *)sender;

@end

