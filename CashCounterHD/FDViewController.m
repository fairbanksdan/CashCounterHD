//
//  FDViewController.m
//  CashCounterHD
//
//  Created by Daniel Fairbanks on 5/1/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "FDViewController.h"
#import "FDNumberPad.h"

@interface FDViewController () <UITextFieldDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSString *str;

@property (strong,nonatomic) NSArray *textFields;

@end

@implementation FDViewController
{
    float _pennyCount;
    float _nickelCount;
    float _dimeCount;
    float _quarterCount;
    
    float _singleDollarCount;
    float _fiveDollarCount;
    float _tenDollarCount;
    float _twentyDollarCount;
    float _fiftyDollarCount;
    float _hundredDollarCount;
    
    float _grandTotalCount;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.pennyTF.inputView  = [[[NSBundle mainBundle] loadNibNamed:@"FDNumberPad" owner:self options:nil] objectAtIndex:0];
    
    // The "normal" numberpad
    self.pennyTF.inputView   = [FDNumberPad defaultFDNumberPad];
    self.nickelTF.inputView = [FDNumberPad defaultFDNumberPad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldShouldReturn:)
                                                 name:@"nextPressed"
                                               object:nil];
}

- (void)viewDidUnload
{
    _pennyTF = nil;
    _nickelTF  = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pennyCounterTF:(id)sender {
    _str = [_pennyTF text];
    
    _pennyCount = [_str integerValue]*.01;
    
    [self Updatelabels];
}
- (IBAction)nickelCounterTF:(id)sender {
    _str = [_nickelTF text];
    
    _nickelCount = [_str integerValue]*0.05;
    
    [self Updatelabels];
}

- (IBAction)dimeCounterTF:(id)sender {
    _str = [_dimeTF text];
    
    _dimeCount = [_str integerValue]*0.1;
    
    [self Updatelabels];
}

- (IBAction)quarterCounterTF:(id)sender {
    _str = [_quarterTF text];
    
    _quarterCount = [_str integerValue]*0.25;
    
    [self Updatelabels];
}

- (IBAction)singleDollarCounterTF:(id)sender {
    _str = [_singleDollarTF text];
    
    _singleDollarCount = [_str integerValue];
    
    [self Updatelabels];
}

- (IBAction)fiveDollarCounterTF:(id)sender {
    _str = [_fiveDollarTF text];
    
    _fiveDollarCount = [_str integerValue]*5;
    
    [self Updatelabels];
}

- (IBAction)tenDollarCounterTF:(id)sender {
    _str = [_tenDollarTF text];
    
    _tenDollarCount = [_str integerValue]*10;
    
    [self Updatelabels];
}

- (IBAction)twentyDollarCounterTF:(id)sender {
    _str = [_twentyDollarTF text];
    
    _twentyDollarCount = [_str integerValue]*20;
    
    [self Updatelabels];
}

- (IBAction)fiftyDollarCounterTF:(id)sender {
    _str = [_fiftyDollarTF text];
    
    _fiftyDollarCount = [_str integerValue]*50;
    
    [self Updatelabels];
}

- (IBAction)hundredDollarCounterTF:(id)sender {
    _str = [_hundredDollarTF text];
    
    _hundredDollarCount = [_str integerValue]*100;
    
    [self Updatelabels];
}

#pragma mark Update Labels Method

-(void)Updatelabels
{
    _grandTotalCount = _pennyCount+_nickelCount+_dimeCount+_quarterCount+_singleDollarCount+_fiftyDollarCount+_tenDollarCount+_twentyDollarCount+_fiftyDollarCount+_hundredDollarCount;
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencySymbol:@""];
    
    self.pennyLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_pennyCount]]];
    self.nickelLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_nickelCount]]];
    self.dimeLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_dimeCount]]];
    self.quarterLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_quarterCount]]];
    self.singleDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_singleDollarCount]]];
    self.fiveDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiveDollarCount]]];
    self.tenDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_tenDollarCount]]];
    self.twentyDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_twentyDollarCount]]];
    self.fiftyDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiftyDollarCount]]];
    self.hundredDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_hundredDollarCount]]];
    
    self.grandTotalLabel.text = [NSString stringWithFormat:@"$%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_grandTotalCount]]];
    
}

- (IBAction)resetButtonPressed:(id)sender {
    NSString *emptyString = [NSString stringWithFormat:@""];
    
    _pennyCount = 0;
    _nickelCount = 0;
    _dimeCount = 0;
    _quarterCount = 0;
    _singleDollarCount = 0;
    _fiveDollarCount = 0;
    _tenDollarCount = 0;
    _twentyDollarCount = 0;
    _fiftyDollarCount = 0;
    _hundredDollarCount = 0;
    _grandTotalCount = 0;
    
    self.pennyLabel.text = [NSString stringWithFormat:@"%.02f",_pennyCount];
    self.nickelLabel.text = [NSString stringWithFormat:@"%.02f",_nickelCount];
    self.dimeLabel.text = [NSString stringWithFormat:@"%.02f",_dimeCount];
    self.quarterLabel.text = [NSString stringWithFormat:@"%.02f",_quarterCount];
    self.singleDollarLabel.text = [NSString stringWithFormat:@"%.02f",_singleDollarCount];
    self.fiveDollarLabel.text = [NSString stringWithFormat:@"%.02f",_fiveDollarCount];
    self.tenDollarLabel.text = [NSString stringWithFormat:@"%.02f",_tenDollarCount];
    self.twentyDollarLabel.text = [NSString stringWithFormat:@"%.02f",_twentyDollarCount];
    self.fiftyDollarLabel.text = [NSString stringWithFormat:@"%.02f",_fiftyDollarCount];
    self.hundredDollarLabel.text = [NSString stringWithFormat:@"%.02f",_hundredDollarCount];
    self.grandTotalLabel.text = [NSString stringWithFormat:@"$%.02f",_grandTotalCount];
    
    self.pennyTF.text = emptyString;
    self.nickelTF.text = emptyString;
    self.dimeTF.text = emptyString;
    self.quarterTF.text = emptyString;
    self.singleDollarTF.text = emptyString;
    self.fiveDollarTF.text = emptyString;
    self.tenDollarTF.text = emptyString;
    self.twentyDollarTF.text = emptyString;
    self.fiftyDollarTF.text = emptyString;
    self.hundredDollarTF.text = emptyString;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@" should return");
    
    if (self.currentTextField.tag == 0)
    {
        [self.pennyTF becomeFirstResponder];
        self.currentTextField = self.pennyTF;
        
    }
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.currentTextField = textField;
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

#pragma mark iAd Delegate Methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
}

@end
