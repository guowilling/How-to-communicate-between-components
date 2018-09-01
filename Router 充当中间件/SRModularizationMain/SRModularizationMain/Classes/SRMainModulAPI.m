//
//  SRMainModulAPI.m
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import "SRMainModulAPI.h"
#import "SRMainTabBarController.h"
#import "SRMainTabBar.h"
#import "SRMainNavigationBar.h"
#import "SRMainNavigationController.h"

@implementation SRMainModulAPI

+ (UITabBarController *)mainTabBarController {
    return [SRMainTabBarController sharedTabBar];
}

+ (void)addTabBarControllerChildVC:(UIViewController *)vc
                             title:(NSString *)title
                             image:(UIImage *)img
                     selectedImage:(UIImage *)selectedImg
                     isEmbedInNavC:(BOOL)flag
{
    [[SRMainTabBarController sharedTabBar] addChildVC:vc
                                                title:title
                                                image:img
                                        selectedImage:selectedImg
                                        isEmbedInNavC:flag];
}

+ (void)setTabBarMiddleItemBackgroundImage:(UIImage *)img {
    SRMainTabBar *tabBar = (SRMainTabBar *)[SRMainTabBarController sharedTabBar].tabBar;
    [tabBar setMiddleItemBackgroundImage:img];
}

+ (void)setTabBarItemSelectedTitleAttributes:(NSDictionary *)attributes {
    SRMainTabBar *tabBar = (SRMainTabBar *)[SRMainTabBarController sharedTabBar].tabBar;
    [tabBar setItemSelectedTitleAttributes:attributes];
}

+ (void)setTabBarDidSelectMiddleItemBlock:(void (^)(void))block {
    SRMainTabBar *tabBar = (SRMainTabBar *)[SRMainTabBarController sharedTabBar].tabBar;
    tabBar.didSelectMiddleItemBlock = block;
}

+ (void)setNavBarBackgroundImage:(UIImage *)img {
    [SRMainNavigationBar setBackgroundImage:img];
}

+ (void)setNavBarTitleTextAttributes:(NSDictionary *)attributes {
    [SRMainNavigationBar setTitleTextAttributes:attributes];
}

@end
