//
//  AppDelegate.m
//  MobileProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //日志初始化
    [MyFileLogger sharedManager];
    
    //启动友盟统计
    [MPUmengHelper UMAnalyticStart];
    
    //地图定位初始化
    [MPLocationManager installMapSDK];
    
    //百度地图定位
    [[MPLocationManager shareInstance] startBMKLocationWithReg:^(BMKUserLocation *loction, NSError *error) {
        if (error) {
            DDLogError(@"定位失败,失败原因：%@",error);
        }
        else
        {
            DDLogError(@"定位信息：%f,%f",loction.location.coordinate.latitude,loction.location.coordinate.longitude);
        }
    }];
    
    //系统自带定位
//    [[MPLocationManager shareInstance]  startSystemLocationWithRes:^(CLLocation *loction, NSError *error) {
//        DDLogError(@"系统自带定位信息：%f,%f",loction.coordinate.latitude,loction.coordinate.longitude);
//    }];
    
    //加载页面
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupLoginViewController];
    
    return YES;
}

//登录页面
-(void)setupLoginViewController
{
    LogInViewController *logInVc = [[LogInViewController alloc]init];
    UINavigationController *navcLogin = [[UINavigationController alloc]initWithRootViewController:logInVc];
    [navcLogin setNavigationBarHidden:YES];
    self.window.rootViewController = navcLogin;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//首页
-(void)setupHomeViewController
{
    HomeViewController *logInVc = [[HomeViewController alloc]init];
    UINavigationController *navcLogin = [[UINavigationController alloc]initWithRootViewController:logInVc];
    [navcLogin setNavigationBarHidden:YES];
    self.window.rootViewController = navcLogin;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
