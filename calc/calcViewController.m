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
    if (currentNumber.doubleValue == 0) {
        currentNumber = [NSDecimalNumber zero];
    }
    if (decimalOn == 1) {
        decimalCount = decimalCount + 1;
        double dcv = ((double)[sender tag] / pow(10,decimalCount));
        currentNumber = [currentNumber decimalNumberByAdding: [[NSDecimalNumber alloc] initWithDouble:dcv]];
    } else {
        currentNumber = [currentNumber decimalNumberByMultiplyingBy:[[NSDecimalNumber alloc] initWithInt:10]];
        currentNumber = [currentNumber decimalNumberByAdding: [[NSDecimalNumber alloc] initWithDouble:(double)[sender tag]]];
    }
    calculatorScreen.text = [NSString stringWithFormat:@"%0.12G",[currentNumber doubleValue]];
    [currentNumber retain];
}

-(IBAction)buttonDecimalPressed:(id)sender {
    decimalCount = 0;
    if (decimalOn == 0) decimalOn = 1;
    else decimalOn = 0;
}

-(IBAction)buttonOperationPressed:(id)sender {
    decimalCount = 0;
    decimalOn = 0;
    if (currentOperation == 0) result = [[NSDecimalNumber alloc] initWithDouble: [currentNumber doubleValue]];
    else {
        switch (currentOperation) {
            case 1:
                result = [result decimalNumberByAdding: currentNumber];
                break;
            case 2:
                result = [result decimalNumberBySubtracting: currentNumber];
                break;
            case 3:
                result = [result decimalNumberByMultiplyingBy: currentNumber];
                break;
            case 4:
                result = [result decimalNumberByDividingBy: currentNumber];
                break;
            case 5:
                currentOperation = 0;
                break;

        }
    }
    currentNumber = [NSDecimalNumber zero];
    calculatorScreen.text = [NSString stringWithFormat:@"%0.12G",result.doubleValue];
    if ([sender tag] == 0) result = [NSDecimalNumber zero];
    currentOperation = [sender tag];
    [result retain];
}


-(IBAction)cancelInput {
    currentNumber = [NSDecimalNumber zero];
    decimalOn = 0;
    decimalCount = 0;
    calculatorScreen.text = @"0";
    [currentNumber retain];
}

-(IBAction)cancelOperation {
    currentNumber = [NSDecimalNumber zero];
    decimalOn = 0;
    decimalCount = 0;
    calculatorScreen.text = @"0";
    currentOperation = 0;
    [currentNumber retain];
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
