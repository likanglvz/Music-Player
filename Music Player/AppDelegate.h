//
//  AppDelegate.h
//  Music Player
//
//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^playerRemoteEventBlock)(UIEvent *event);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic, copy) playerRemoteEventBlock myRemoteEventBlock;

@end

