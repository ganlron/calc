//
//  calcViewController.h
//  calc
//
//  Created by Derek Buttineau on 11-05-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calcViewController : UIViewController {
    float result;
    IBOutlet UILabel *calculatorScreen;
    int currentOperation;
    float currentNumber;
    float currentDecimal;
    int decimalCount;
    BOOL decimalOn;
    
}

-(IBAction)buttonDigitPressed:(id)sender;
-(IBAction)buttonDecimalPressed:(id)sender;
-(IBAction)buttonOperationPressed:(id)sender;
-(IBAction)cancelInput;
-(IBAction)cancelOperation;

@end
