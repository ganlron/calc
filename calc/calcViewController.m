//
//  calcViewController.m
//  calc
//
//  Created by Derek Buttineau on 11-05-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "calcViewController.h"

@implementation calcViewController

-(IBAction)buttonDigitPressed:(id)sender {
    if (decimalOn == 1) {
        decimalCount = decimalCount + 1;
        currentDecimal = currentDecimal + ((float)[sender tag] / pow(10,decimalCount));
        calculatorScreen.text = [NSString stringWithFormat:@"%2f",currentNumber + currentDecimal];
    } else {
        currentNumber = currentNumber *10 + (float)[sender tag];
        calculatorScreen.text = [NSString stringWithFormat:@"%2f",currentNumber];
    }
}

-(IBAction)buttonDecimalPressed:(id)sender {
    decimalCount = 0;
    if (decimalOn == 0) decimalOn = 1;
    else decimalOn = 0;
}

-(IBAction)buttonOperationPressed:(id)sender {
    decimalCount = 0;
    decimalOn = 0;
    float totalNumber = currentNumber + currentDecimal;
    if (currentOperation == 0) result = totalNumber;
    else {
        switch (currentOperation) {
            case 1:
                result = result + totalNumber;
                break;
            case 2:
                result = result - totalNumber;
                break;
            case 3:
                result = result * totalNumber;
                break;
            case 4:
                result = result / totalNumber;
                break;
            case 5:
                currentOperation = 0;
                break;

        }
    }
    currentNumber = 0;
    currentDecimal = 0;
    calculatorScreen.text = [NSString stringWithFormat:@"%2f",result];
    if ([sender tag] == 0) result = 0;
    currentOperation = [sender tag];
}


-(IBAction)cancelInput {
    currentNumber = 0;
    decimalOn = 0;
    decimalCount = 0;
    calculatorScreen.text = @"0";
}

-(IBAction)cancelOperation {
    currentNumber = 0;
    decimalOn = 0;
    decimalCount = 0;
    calculatorScreen.text = @"0";
    currentOperation = 0;
}


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
