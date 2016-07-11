//
//  NetWork.m
//  MusicPlayer
//
//  Created by AppleUser1 on 16/6/29.
//  Copyright © 2016年 AppleUser1. All rights reserved.
//

#import "NetWork.h"


@interface NetWork ()

@property (strong, nonatomic) AFHTTPSessionManager * manager;



@end


@implementation NetWork

static NetWork * newwork = nil;
//单例
+ (instancetype)network
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        newwork = [[self alloc]init];
    });
    newwork.manager = [AFHTTPSessionManager manager];
    return newwork;
    
}

- (void)getObjectWithUrl:(NSString *)url Success:(success)successBlock failure:(failure)failureBlock;
{
 
    [self.manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary * dict = (NSDictionary *)responseObject;
        
        //NSLog(@"%@",dict);
        successBlock(dict);

    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
    
    
    

}








@end
