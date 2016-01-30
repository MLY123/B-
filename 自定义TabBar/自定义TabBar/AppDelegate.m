//
//  AppDelegate.m
//  自定义TabBar
//
//  Created by lanouhn on 16/1/29.
//  Copyright © 2016年 孟刘扬. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     // Override point for customization after application launch.
     self.window.backgroundColor = [UIColor whiteColor];
     [self.window makeKeyAndVisible];
      // 创建要作为tabbar所控制的视图控制器数组
     NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
     for(int i = 0 ; i < 5 ; i ++){
          UIViewController *vc = [[UIViewController alloc]init];
          // 为了好区分，给他们加上随机的背景色
          vc.view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
          [array addObject:vc];
     
     }
     
          //1.初始化自定义tabbarController
     CustomTabBarViewController *customTB = [[CustomTabBarViewController alloc]initWithViewControllers:array];
          // 给tabbar上的item的视图图片名数组
     customTB.imagesNameArr = @[@"item0",@"item1",@"item2",@"item3",@"item4"];
     self.window.rootViewController = customTB;
     return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
     // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
     // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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

@end
