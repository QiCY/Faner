//
//  AppDelegate.m
//  Faner
//
//  Created by apple on 2017/11/4.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MineViewController.h"
#import "SelectClothesViewController.h"
#import "WishListViewController.h"
#import "CanBuyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.rootViewController = [self tabBarViewController];
    return YES;
}
- (UITabBarController *)tabBarViewController{
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:[MainViewController new]];
    mainNav.tabBarItem.title = @"首页";
    
    UINavigationController *choiceNav = [[UINavigationController alloc] initWithRootViewController:[SelectClothesViewController new]];
    choiceNav.tabBarItem.title = @"选衣";
    
    UINavigationController *hopeNav = [[UINavigationController alloc] initWithRootViewController:[WishListViewController new]];
    hopeNav.tabBarItem.title = @"心愿单";
    
    UINavigationController *canBuyNav = [[UINavigationController alloc] initWithRootViewController:[CanBuyViewController new]];
    canBuyNav.tabBarItem.title = @"可买";
    
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:[MineViewController new]];
    mineNav.tabBarItem.title = @"我的";
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[mainNav,choiceNav,hopeNav,canBuyNav,mineNav];
    tab.tabBar.tintColor = [UIColor orangeColor];
    //设置标签栏的颜色
//        tab.tabBar.barTintColor = [UIColor blackColor];
    return tab;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
