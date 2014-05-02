//
//  FDViewController.h
//  CashCounterHD
//
//  Created by Daniel Fairbanks on 5/1/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface FDViewController : UIViewController <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *pennyTF;
@property (weak, nonatomic) IBOutlet UITextField *nickelTF;
@property (weak, nonatomic) IBOutlet UITextField *dimeTF;
@property (weak, nonatomic) IBOutlet UITextField *quarterTF;
@property (weak, nonatomic) IBOutlet UITextField *singleDollarTF;
@property (weak, nonatomic) IBOutlet UITextField *fiveDollarTF;
@property (weak, nonatomic) IBOutlet UITextField *tenDollarTF;
@property (weak, nonatomic) IBOutlet UITextField *twentyDollarTF;
@property (weak, nonatomic) IBOutlet UITextField *fiftyDollarTF;
@property (weak, nonatomic) IBOutlet UITextField *hundredDollarTF;

@property (weak, nonatomic) IBOutlet UILabel *pennyLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickelLabel;
@property (weak, nonatomic) IBOutlet UILabel *dimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *quarterLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleDollarLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiveDollarLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenDollarLabel;
@property (weak, nonatomic) IBOutlet UILabel *twentyDollarLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiftyDollarLabel;
@property (weak, nonatomic) IBOutlet UILabel *hundredDollarLabel;

@property (weak, nonatomic) IBOutlet UILabel *grandTotalLabel;

@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@property (weak,nonatomic) UITextField *currentTextField;
@end
