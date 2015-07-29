//
//  samplesUser.h
//  Microsoft Tasks
//
//  Created by Brandon Werner on 7/29/15.
//  Copyright © 2015 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userTitle;
@property (nonatomic, strong) NSString *userTime;
@property (nonatomic, strong) NSString *userImageName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)userList;

@end
