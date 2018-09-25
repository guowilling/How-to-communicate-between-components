//
//  SRMediator+SRMain.h
//  SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/9/1.
//  Copyright © 2018年 guowilling. All rights reserved.
//

#import "SRMediator.h"

@interface SRMediator (SRMain)

+ (UITabBarController *)mainTabBarController;

+ (void)addTabBarControllerChildVCWithParams:(NSDictionary *)params;

+ (void)setTabBarDidSelectMiddleItemBlock:(void (^)(void))block;

@end
