//
//  SRMediator+SRMain.m
//  SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/9/1.
//  Copyright © 2018年 guowilling. All rights reserved.
//

#import "SRMediator+SRMain.h"

@implementation SRMediator (SRMain)

+ (UITabBarController *)mainTabBarController {
    return [self performTarget:@"SRMainModulAPI"
                        action:@"mainTabBarController"
                        params:nil
              isRequiredReturn:YES];
}

+ (void)addTabBarControllerChildVCWithParams:(NSDictionary *)params {
    [self performTarget:@"SRMainModulAPI"
                 action:@"addTabBarControllerChildVCWithParams:"
                 params:params
       isRequiredReturn:NO];
}

+ (void)setTabBarDidSelectMiddleItemBlock:(void (^)(void))block {
    [self performTarget:@"SRMainModulAPI"
                 action:@"setTabBarDidSelectMiddleItemBlock:"
                 params:block
       isRequiredReturn:NO];
}

@end
