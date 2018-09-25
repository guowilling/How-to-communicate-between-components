//
//  SRMainNavigationController.m
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import "SRMainNavigationController.h"
#import "SRMainNavigationBar.h"

@interface SRMainNavigationController ()

@end

@implementation SRMainNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[SRMainNavigationBar alloc] init] forKey:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    return [super pushViewController:viewController animated:animated];
}

@end
