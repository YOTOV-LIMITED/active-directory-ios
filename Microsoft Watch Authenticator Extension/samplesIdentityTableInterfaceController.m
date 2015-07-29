//
//  samplesIdentityTableInterfaceController.m
//  Microsoft Tasks
//
//  Created by Brandon Werner on 7/29/15.
//  Copyright © 2015 Microsoft. All rights reserved.
//

#import "samplesIdentityTableInterfaceController.h"
#import "User.h"
#import "samplesIdentityRow.h"
#import "ADALiOS_Watch/ADAuthenticationContext.h"
#import <ADALiOS_Watch/ADAuthenticationSettings.h>

@interface samplesIdentityTableInterfaceController ()
    
    
@property NSMutableArray *userData;
    

@end

@implementation samplesIdentityTableInterfaceController

@synthesize tableView;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    self.userData = [[NSMutableArray alloc] init];

        [self reloadTable];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)showAlertWithStyle:(WKAlertControllerStyle)style
{
    
    WKAlertAction *defaultAction = [WKAlertAction actionWithTitle:@"Default" style:WKAlertActionStyleDefault handler:^{
        NSLog(@"default");
    }];
    
    WKAlertAction *cancelAction = [WKAlertAction actionWithTitle:@"Cancel" style:WKAlertActionStyleCancel handler:^{
        NSLog(@"cancel");
        
    }];
    
    WKAlertAction *destructiveAction = [WKAlertAction actionWithTitle:@"Destructive" style:WKAlertActionStyleDestructive handler:^{
        NSLog(@"destructive");
    }];
    
    NSArray *actions = [NSArray new];
    
    if (style == WKAlertControllerStyleSideBySideButtonsAlert) {
        actions = @[defaultAction, cancelAction];
    } else {
        actions = @[defaultAction, cancelAction, destructiveAction];
    }
    
    [self presentAlertControllerWithTitle:@"Title" message:@"Show message." preferredStyle:style actions:actions];
}

- (void)reloadTable {
    
    ADAuthenticationError* error;
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    NSArray* array = [cache allItemsWithError:&error];
    NSMutableArray *rowTypesList = [NSMutableArray array];
    
    if (error)
    {
        
        WKAlertAction *defaultAction = [WKAlertAction actionWithTitle:@"Default" style:WKAlertActionStyleDefault handler:^{
            NSLog(@"default");
        }];
        
        WKAlertAction *cancelAction = [WKAlertAction actionWithTitle:@"Cancel" style:WKAlertActionStyleCancel handler:^{
            NSLog(@"cancel");
            
        }];
        
        WKAlertAction *destructiveAction = [WKAlertAction actionWithTitle:@"Destructive" style:WKAlertActionStyleDestructive handler:^{
            NSLog(@"destructive");
        }];
        
   //     WKAlertAction *defaultAction = [WKAlertAction actionWithTitle:[[NSString alloc]initWithFormat:@"%@", error.errorDetails] style:WKAlertActionStyleDefault handler:^{
   //         NSLog(@"default");
    //    }];
        
        [self presentAlertControllerWithTitle:@"Auth Error" message:[[NSString alloc]initWithFormat:@"%@", error.errorDetails] preferredStyle:WKAlertActionStyleDefault actions:defaultAction];
 
        
    } else
    {
        NSMutableSet* users = [NSMutableSet new];
        [tableView setRowTypes:rowTypesList];
        for(ADTokenCacheStoreItem* item in array)
        {
            ADUserInformation *user = item.userInformation;
            if (!item) {
                
                [rowTypesList addObject:@"samplesIdentityRow"];
                [users addObject:@"No user"];
                
            }
            else if (item || !item.userInformation)
            {
                user = [ADUserInformation userInformationWithUserId:@"Unknown user" error:nil];
            }
            else if (item || [users containsObject:user.userId])
            {
                //New user, add and print:
                [rowTypesList addObject:@"samplesIdentityRow"];
                [users addObject:user.userId];
                
            }
           
            
            for (NSInteger i = 0; i < tableView.numberOfRows; i++)
            {
                NSObject *row = [tableView rowControllerAtIndex:i];
                User *user = _userData[i];
                
                samplesIdentityRow *userRow = (samplesIdentityRow *) row;
                [userRow.userLabel setText:user.userTitle];
            }

        }
        
        // Refresh main thread since we are async
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadTable];
        });
    } }


@end
