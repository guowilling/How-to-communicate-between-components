//
//  SRMainTabBarController.m
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import "SRMainTabBarController.h"
#import "SRMainTabBar.h"
#import "SRMainNavigationController.h"

@interface SRMainTabBarController ()

@end

@implementation SRMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setValue:[SRMainTabBar new] forKey:@"tabBar"];
}

+ (instancetype)sharedTabBar {
    static SRMainTabBarController *tabBarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBarC = [[SRMainTabBarController alloc] init];
    });
    return tabBarC;
}

+ (instancetype)tabBarControllerWithBlock:(void (^)(SRMainTabBarController *tabBarC))addChildVCsBlock {
    SRMainTabBarController *tabBarC = [[SRMainTabBarController alloc] init];
    if (addChildVCsBlock) {
        addChildVCsBlock(tabBarC);
    }
    return tabBarC;
}

- (void)addChildVC:(UIViewController *)vc
             title:(NSString *)title
             image:(UIImage *)img
     selectedImage:(UIImage *)selectedImg
     isEmbedInNavC:(BOOL)flag
{
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:img selectedImage:selectedImg];
    if (flag) {
        vc.navigationItem.title = title;
        SRMainNavigationController *navC = [[SRMainNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:navC];
    } else {
        [self addChildViewController:vc];
    }
}

@end
