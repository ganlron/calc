//
//  calcAppDelegate.h
//  calc
//
//  Created by Derek Buttineau on 11-05-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class calcViewController;

@interface calcAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet calcViewController *viewController;

@end
