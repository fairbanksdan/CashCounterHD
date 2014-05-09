//
//  FDNumberPad.h
//  CashCounterHD
//
//  Created by Daniel Fairbanks on 5/1/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FDNumberPadOptions) {
    FDNumberPadOptionsDefault,
    FDNumberPadOptionsDenominationIcons
};

@interface FDNumberPad : UIView

@property (weak,nonatomic) UIViewController *VC;

+(FDNumberPad *)defaultFDNumberPad;
+(FDNumberPad *)denominationOptionsFDNumberPad;

@end
