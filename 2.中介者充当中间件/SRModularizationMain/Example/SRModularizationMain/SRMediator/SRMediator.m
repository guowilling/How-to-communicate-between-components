//
//  SRMediator.m
//  SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/9/1.
//  Copyright © 2018年 guowilling. All rights reserved.
//

#import "SRMediator.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation SRMediator

+ (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
             params:(id)params
   isRequiredReturn:(BOOL)flag
{
    Class targetCls = NSClassFromString(targetName);
    if (!targetCls) {
        NSLog(@"目标不存在");
        return nil;
    }
    SEL sel = NSSelectorFromString(actionName);
    if (!sel) {
        NSLog(@"方法不存在");
        return nil;
    }
    if (![targetCls respondsToSelector:sel]) {
        NSLog(@"目标不存在该方法");
        return nil;
    }
    if (flag) {
        SuppressPerformSelectorLeakWarning(return [targetCls performSelector:sel withObject:params]);
    } else {
        SuppressPerformSelectorLeakWarning([targetCls performSelector:sel withObject:params]);
    }
    return nil;
}

@end
