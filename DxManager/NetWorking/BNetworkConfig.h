//
//  BNetworkConfig.h
//  BKMobile
//
//  Created by Guibin on 14/2/9.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKURL.h"

@interface BNetworkConfig : NSObject

+ (BNetworkConfig *)sharedInstance;

@property (strong, nonatomic) NSString *baseUrl;

@property (strong, nonatomic) NSString *cdnUrl;

/**
 *  给url追加arguments，用于全局参数，比如AppVersion, ApiVersion,等
 */
@property (strong, nonatomic) NSDictionary *argumentsDic;

@end
