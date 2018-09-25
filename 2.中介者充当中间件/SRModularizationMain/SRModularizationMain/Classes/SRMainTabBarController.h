//
//  SRMainTabBarController.h
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import <UIKit/UIKit.h>

@interface SRMainTabBarController : UITabBarController

+ (instancetype)sharedTabBar;

+ (instancetype)tabBarControllerWithBlock:(void (^)(SRMainTabBarController *tabBarC))addChildVCsBlock;

- (void)addChildVC:(UIViewController *)vc
             title:(NSString *)title
             image:(UIImage *)img
     selectedImage:(UIImage *)selectedImg
     isEmbedInNavC:(BOOL)flag;

@end
