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

@property (weak, nonatomic) IBOutlet UIScrollView *denominationsView;
@property (weak, nonatomic) IBOutlet FDNumberPad *NumberPad;
@property (weak, nonatomic) IBOutlet UIView *textFieldsView;
@property (weak, nonatomic) IBOutlet UIView *labelTotalsView;
@property (weak, nonatomic) IBOutlet ADBannerView *adOne;

@end

@implementation FDViewController
{
    float _pennyCount;
    float _nickelCount;
    float _dimeCount;
    float _quarterCount;
    float _fiftyCentCount;
    
    float _twoDollarCount;
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
    
    self.pennyTF.inputView   = [FDNumberPad defaultFDNumberPad];
    self.nickelTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.dimeTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.quarterTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.fiftyCentTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.singleDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.twoDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.fiveDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.tenDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.twentyDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.fiftyDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    self.hundredDollarTF.inputView = [FDNumberPad defaultFDNumberPad];
    
    
    self.pennyTF.delegate = self;
    self.nickelTF.delegate = self;
    self.dimeTF.delegate = self;
    self.quarterTF.delegate = self;
    self.fiftyCentTF.delegate = self;
    self.singleDollarTF.delegate = self;
    self.twoDollarTF.delegate = self;
    self.fiveDollarTF.delegate = self;
    self.tenDollarTF.delegate = self;
    self.twentyDollarTF.delegate = self;
    self.fiftyDollarTF.delegate = self;
    self.hundredDollarTF.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(nextButtonPressed)
                                                 name:@"nextPressed"
                                               object:nil];
    
    _pennyTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _pennyTF.layer.borderWidth = 1;
    _nickelTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _nickelTF.layer.borderWidth = 1;
    _dimeTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _dimeTF.layer.borderWidth = 1;
    _quarterTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _quarterTF.layer.borderWidth = 1;
    _fiftyCentTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _fiftyCentTF.layer.borderWidth = 1;
    _singleDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _singleDollarTF.layer.borderWidth = 1;
    _twoDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _twoDollarTF.layer.borderWidth = 1;
    _fiveDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _fiveDollarTF.layer.borderWidth = 1;
    _tenDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _tenDollarTF.layer.borderWidth = 1;
    _twentyDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _twentyDollarTF.layer.borderWidth = 1;
    _fiftyDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _fiftyDollarTF.layer.borderWidth = 1;
    _hundredDollarTF.layer.borderColor=[[UIColor grayColor]CGColor];
    _hundredDollarTF.layer.borderWidth = 1;
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //[self updateLayoutForNewOrientation:self.interfaceOrientation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self updateLayoutForNewOrientation:self.interfaceOrientation];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [_pennyTF becomeFirstResponder];
    
    [UIView commitAnimations];

    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField Methods

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
- (IBAction)fiftyCentCounterTF:(id)sender {
    _str = [_fiftyCentTF text];
    
    _fiftyCentCount = [_str integerValue]*0.5;
    
    [self Updatelabels];
}

- (IBAction)singleDollarCounterTF:(id)sender {
    _str = [_singleDollarTF text];
    
    _singleDollarCount = [_str integerValue];
    
    [self Updatelabels];
}
- (IBAction)twoDollarCounterTF:(id)sender {
    _str = [_twoDollarTF text];
    
    _twoDollarCount = [_str integerValue]*2;
    
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
    _grandTotalCount = _pennyCount+_nickelCount+_dimeCount+_quarterCount+_fiftyCentCount+_singleDollarCount+_twoDollarCount+_fiveDollarCount+_tenDollarCount+_twentyDollarCount+_fiftyDollarCount+_hundredDollarCount;
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencySymbol:@""];
    
    self.pennyLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_pennyCount]]];
    self.nickelLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_nickelCount]]];
    self.dimeLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_dimeCount]]];
    self.quarterLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_quarterCount]]];
    self.fiftyCentLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiftyCentCount]]];
    self.singleDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_singleDollarCount]]];
    self.twoDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_twoDollarCount]]];
    self.fiveDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiveDollarCount]]];
    self.tenDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_tenDollarCount]]];
    self.twentyDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_twentyDollarCount]]];
    self.fiftyDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_fiftyDollarCount]]];
    self.hundredDollarLabel.text = [NSString stringWithFormat:@"%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_hundredDollarCount]]];
    
    self.grandTotalLabel.text = [NSString stringWithFormat:@"$%@",[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:_grandTotalCount]]];
    
}

#pragma mark - Button Actions

- (IBAction)resetButtonPressed {
    NSString *emptyString = [NSString stringWithFormat:@""];
    
    _pennyCount = 0;
    _nickelCount = 0;
    _dimeCount = 0;
    _quarterCount = 0;
    _fiftyCentCount = 0;
    _singleDollarCount = 0;
    _twoDollarCount = 0;
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
    self.fiftyCentLabel.text = [NSString stringWithFormat:@"%.02f",_fiftyCentCount];
    self.singleDollarLabel.text = [NSString stringWithFormat:@"%.02f",_singleDollarCount];
    self.twoDollarLabel.text = [NSString stringWithFormat:@"%.02f",_twoDollarCount];
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
    self.fiftyCentTF.text = emptyString;
    self.singleDollarTF.text = emptyString;
    self.twoDollarTF.text = emptyString;
    self.fiveDollarTF.text = emptyString;
    self.tenDollarTF.text = emptyString;
    self.twentyDollarTF.text = emptyString;
    self.fiftyDollarTF.text = emptyString;
    self.hundredDollarTF.text = emptyString;
}

- (IBAction)resetButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Reset"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1)
    {
        [self resetButtonPressed];
        [_pennyTF becomeFirstResponder];
        
    }
}

-(void)nextButtonPressed
{
    [self textFieldShouldReturn:self.currentTextField];
}

//- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
//    self.resetButton.enabled = newText.length > 0;
//    return YES;
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag + 1;
    
    UIResponder *nextResponder = [textField.superview viewWithTag:nextTag];

    
    if (nextResponder) {
        
        [nextResponder becomeFirstResponder];
    }
        else if (textField.tag == 11) {
        [_pennyTF becomeFirstResponder];
        
    }
    return NO; // We do not want UITextField to insert line-breaks.

}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentTextField = textField;
}

#pragma mark - Orientation Methods

-(void)updateLayoutForNewOrientation:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        
        self.denominationsView.frame = CGRectMake(0, 58,624,652);
        self.NumberPad.frame = CGRectMake(624, 200, 400, 352);
        self.textFieldsView.frame = CGRectMake(190, 58, 240, 488);
        self.labelTotalsView.frame = CGRectMake(414, 58, 215, 551);
        
    }
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self updateLayoutForNewOrientation: toInterfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)backButtonPressed:(id)sender {

    if ([_pennyTF isFirstResponder]) {
        [_hundredDollarTF becomeFirstResponder];
    } else if ([_nickelTF isFirstResponder]) {
        [_pennyTF becomeFirstResponder];
    } else if ([_dimeTF isFirstResponder]) {
        [_nickelTF becomeFirstResponder];
    } else if ([_quarterTF isFirstResponder]) {
        [_dimeTF becomeFirstResponder];
    } else if ([_fiftyCentTF isFirstResponder]) {
        [_quarterTF becomeFirstResponder];
    } else if ([_singleDollarTF isFirstResponder]) {
        [_fiftyCentTF becomeFirstResponder];
    } else if ([_twoDollarTF isFirstResponder]) {
        [_singleDollarTF becomeFirstResponder];
    } else if ([_fiveDollarTF isFirstResponder]) {
        [_twoDollarTF becomeFirstResponder];
    } else if ([_tenDollarTF isFirstResponder]) {
        [_fiveDollarTF becomeFirstResponder];
    } else if ([_twentyDollarTF isFirstResponder]) {
        [_tenDollarTF becomeFirstResponder];
    } else if ([_fiftyDollarTF isFirstResponder]) {
        [_twentyDollarTF becomeFirstResponder];
    } else {
        [_fiftyDollarTF becomeFirstResponder];
    }
    
}

@end
