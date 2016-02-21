//
//  AVHUGAPIManager.m
//  AVHeadsUpGame
//
//  Created by Ayuna Vogel on 2/21/16.
//  Copyright © 2016 Ayuna Vogel. All rights reserved.
//

#import "AVHUGAPIManager.h"

#define APIdataURL @"https://heads-up-api.herokuapp.com"

@implementation AVHUGAPIManager

+ (void)getData:(void(^)(NSArray *data))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:APIdataURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSLog(@"ResponseObject is %@", responseObject);
        
        completion(responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@", error);
    }];
}

@end
