//
//  SRMainNavigationBar.m
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/31.
//

#import "SRMainNavigationBar.h"

#define NavBarColor [UIColor colorWithRed:250/255.0 green:227/255.0 blue:111/255.0 alpha:1.0]

@implementation SRMainNavigationBar

+ (void)initialize {
    {
        UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
        attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
        [barButtonItemAppearance setTitleTextAttributes:attributes forState:UIControlStateNormal];
    }
    {
        [self setBackgroundImage:[self imageWithColor:NavBarColor]];
        
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
        [self setTitleTextAttributes:attributes];
    }
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextFillRect(ctx, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)setBackgroundImage:(UIImage *)img {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}

+ (void)setTitleTextAttributes:(NSDictionary *)attributes {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setTitleTextAttributes:attributes];
}

@end
