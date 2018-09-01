//
//  SRAppDelegate.m
//  SRModularizationMain
//
//  Created by guowilling on 08/30/2018.
//  Copyright (c) 2018 guowilling. All rights reserved.
//

#import "SRAppDelegate.h"
#import "SRMainModulAPI.h"
#import "HomeViewController.h"
#import "FishViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "PostViewController.h"

@implementation SRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [SRMainModulAPI addTabBarControllerChildVC:[[HomeViewController alloc] init]
                                         title:@"首页"
                                         image:[[UIImage imageNamed:@"home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 selectedImage:[[UIImage imageNamed:@"home_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 isEmbedInNavC:YES];
    [SRMainModulAPI addTabBarControllerChildVC:[[FishViewController alloc] init]
                                         title:@"鱼塘"
                                         image:[[UIImage imageNamed:@"fish_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 selectedImage:[[UIImage imageNamed:@"fish_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 isEmbedInNavC:YES];
    [SRMainModulAPI addTabBarControllerChildVC:[[MessageViewController alloc] init]
                                         title:@"消息"
                                         image:[[UIImage imageNamed:@"message_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 selectedImage:[[UIImage imageNamed:@"message_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 isEmbedInNavC:YES];
    [SRMainModulAPI addTabBarControllerChildVC:[[MineViewController alloc] init]
                                         title:@"我的"
                                         image:[[UIImage imageNamed:@"account_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 selectedImage:[[UIImage imageNamed:@"account_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 isEmbedInNavC:YES];
    
    [SRMainModulAPI setTabBarDidSelectMiddleItemBlock:^{
        PostViewController *postVC = [[PostViewController alloc] init];
        postVC.view.backgroundColor = [UIColor randomColor];
        [self.window.rootViewController presentViewController:postVC animated:YES completion:nil];
    }];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    [SRMainModulAPI setTabBarItemSelectedTitleAttributes:attributes];
    
    self.window.rootViewController = [SRMainModulAPI mainTabBarCcontroller];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
