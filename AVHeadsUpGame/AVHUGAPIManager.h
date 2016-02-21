//
//  AVHUGAPIManager.h
//  AVHeadsUpGame
//
//  Created by Ayuna Vogel on 2/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import <Foundation/Foundation.h>

@interface AVHUGAPIManager : NSObject

+ (void)getData:(void(^)(NSArray *data))completion;

@end
