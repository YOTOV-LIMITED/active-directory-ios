//
//  samplesUser.m
//  Microsoft Tasks
//
//  Created by Brandon Werner on 7/29/15.
//  Copyright © 2015 Microsoft. All rights reserved.
//

#import "User.h"
#import "ADALiOS_Watch/ADAuthenticationContext.h"

@implementation User

@synthesize userImageName;
@synthesize userTime;
@synthesize userTitle;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        userTitle = dictionary[@"userTitle"];
        //userTime = dictionary[@"userTime"];
        //userImageName = dictionary[@"userImageName"];
    }
    
    return self;
}

+ (NSArray *)userList
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"User" ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:dataPath];
    
    for (NSDictionary *e in data)
    {
        User *user = [[User alloc] initWithDictionary:e];
        [array addObject:user];
    }
    
    return array;
}
@end
