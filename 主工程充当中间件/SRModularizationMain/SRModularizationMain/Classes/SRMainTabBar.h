//
//  SRMainTabBar.h
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import <UIKit/UIKit.h>

@interface SRMainTabBar : UITabBar

@property (nonatomic, copy) void (^didSelectMiddleItemBlock)(void);

- (void)setMiddleItemBackgroundImage:(UIImage *)img;

- (void)setItemSelectedTitleAttributes:(NSDictionary *)attributes;

@end
