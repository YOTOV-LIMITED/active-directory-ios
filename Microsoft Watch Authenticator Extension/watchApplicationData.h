//
//  watchApplicationData.h
//  Microsoft Tasks
//
//  Created by Brandon Werner on 7/29/15.
//  Copyright © 2015 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ADALiOS_Watch/ADAuthenticationResult.h>

@interface watchApplicationData : NSObject

@property (strong) ADTokenCacheStoreItem *userItem;
@property (strong) NSString* taskWebApiUrlString;
@property (strong) NSString* authority;
@property (strong) NSString* clientId;
@property (strong) NSString* resourceId;
@property (strong) NSString* redirectUriString;
@property (strong) NSString* correlationId;
@property BOOL fullScreen;
@property BOOL showClaims;

+(id) getInstance;

@end
