//
//  AppDelegate.m
//  Music Player
////
//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼            BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

//  Created by 李康 on 16/6/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "AppDelegate.h"
#import "SoundViewController.h"
#import "ChartsViewController.h"
#import "ClassifyViewController.h"
#import "MyViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"SoundStoryboard" bundle:[NSBundle mainBundle]];
    //听觉盛宴
    SoundViewController *soundpage = [storyboard instantiateViewControllerWithIdentifier:@"Sound"];
    UINavigationController *soundpageNav = [[UINavigationController alloc] initWithRootViewController:soundpage];
    
    //音乐排行
    ChartsViewController *chartspage = [[ChartsViewController alloc]initWithNibName:nil bundle:nil];
    UINavigationController *chartspageNav = [[UINavigationController alloc] initWithRootViewController:chartspage];
    
    //分类享听
    ClassifyViewController *classifypage = [[ClassifyViewController alloc]initWithNibName:nil bundle:nil];
    UINavigationController *classifypageNav = [[UINavigationController alloc] initWithRootViewController:classifypage];
    
    //我的音乐
    MyViewController *mypage = [[MyViewController alloc]initWithNibName:nil bundle:nil];
    UINavigationController *mypageNav = [[UINavigationController alloc] initWithRootViewController:mypage];
    
    //创建UITabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    //设置viewControllers
    tabBarController.viewControllers = @[soundpageNav,chartspageNav,classifypageNav,mypageNav];
    
    
    tabBarController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    soundpageNav.tabBarItem.title =@"听觉盛宴";
    soundpageNav.tabBarItem.image = [UIImage imageNamed:@"cm2_note_icn_listen@2x"];
    chartspageNav.tabBarItem.title = @"音乐排行";
    chartspageNav.tabBarItem.image = [UIImage imageNamed:@"cm2_note_icn_logo@2x"];
    classifypageNav.tabBarItem.title = @"分类享听";
    classifypageNav.tabBarItem.image = [UIImage imageNamed:@"cm2_btm_icn_music_prs@2x"];
    mypageNav.tabBarItem.title = @"我的音乐";
    mypageNav.tabBarItem.image = [UIImage imageNamed:@"ic_radiopage_personal@2x"];


    self.window.rootViewController = tabBarController;
    
    
    
    
    
  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //开启后台任务
    [application beginBackgroundTaskWithExpirationHandler:nil];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
