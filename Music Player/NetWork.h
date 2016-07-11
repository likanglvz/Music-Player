//
//  NetWork.h
//  MusicPlayer
//
//  Created by AppleUser1 on 16/6/29.
//  Copyright © 2016年 AppleUser1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^success)(NSDictionary * dict);
typedef void(^failure)(NSError * err);


@interface NetWork : NSObject

+ (instancetype)network;

- (void)getObjectWithUrl:(NSString *)url Success:(success)successBlock failure:(failure)failureBlock;





@end
