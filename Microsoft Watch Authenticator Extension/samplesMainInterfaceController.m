//
//  samplesMainInterfaceController.m
//  Microsoft Tasks
//
//  Created by Brandon Werner on 7/29/15.
//  Copyright © 2015 Microsoft. All rights reserved.
//

#import "samplesMainInterfaceController.h"

@interface samplesMainInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *accountPressed;

@end

@implementation samplesMainInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



