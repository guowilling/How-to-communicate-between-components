//
//  SRMainModulAPI.h
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import <Foundation/Foundation.h>

@interface SRMainModulAPI : NSObject

+ (UITabBarController *)mainTabBarController;

+ (void)addTabBarControllerChildVC:(UIViewController *)vc
                             title:(NSString *)title
                             image:(UIImage *)img
                     selectedImage:(UIImage *)selectedImg
                     isEmbedInNavC:(BOOL)flag;

+ (void)setTabBarMiddleItemBackgroundImage:(UIImage *)img;
+ (void)setTabBarItemSelectedTitleAttributes:(NSDictionary *)attributes;
+ (void)setTabBarDidSelectMiddleItemBlock:(void (^)(void))block;

+ (void)setNavBarBackgroundImage:(UIImage *)img;
+ (void)setNavBarTitleTextAttributes:(NSDictionary *)attributes;

@end
