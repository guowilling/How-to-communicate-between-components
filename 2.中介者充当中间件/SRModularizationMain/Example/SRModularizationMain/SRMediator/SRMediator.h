//
//  SRMediator.h
//  SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/9/1.
//  Copyright © 2018年 guowilling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRMediator : NSObject

+ (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
             params:(id)params
   isRequiredReturn:(BOOL)flag;

@end
