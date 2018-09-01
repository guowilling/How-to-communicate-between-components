//
//  SRMainRouter.m
//  MGJRouter
//
//  Created by Willing Guo on 2018/9/1.
//

#import "SRMainRouter.h"
#import "SRMainModulAPI.h"
#import "MGJRouter.h"

@implementation SRMainRouter

+ (void)load {
    // 注册服务提供给外界
    [MGJRouter registerURLPattern:@"sr://mainTabBarC" toObjectHandler:^id(NSDictionary *routerParameters) {
        return [SRMainModulAPI mainTabBarController];
    }];
    
    // 注册服务提供给外界
    [MGJRouter registerURLPattern:@"sr://addTabBarControllerChildVC" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *vc = routerParameters[MGJRouterParameterUserInfo][@"vc"];
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
        UIImage *image = routerParameters[MGJRouterParameterUserInfo][@"image"];
        UIImage *selectedImage = routerParameters[MGJRouterParameterUserInfo][@"selectedImage"];
        BOOL isEmbedInNavC = [routerParameters[MGJRouterParameterUserInfo][@"isEmbedInNavC"] boolValue];
        [SRMainModulAPI addTabBarControllerChildVC:vc
                                             title:title
                                             image:image
                                     selectedImage:selectedImage
                                     isEmbedInNavC:isEmbedInNavC];
    }];
    
    // 调用外界提供的服务
    [SRMainModulAPI setTabBarDidSelectMiddleItemBlock:^{
        [MGJRouter openURL:@"sr://tabBarDidSelectMiddleItem"
              withUserInfo:@{@"userInfo": @"userInfo"}
                completion:nil];
    }];
}

@end
