//
//  FishViewController.m
//  XianyuTabBar
//
//  Created by Willing Guo on 17/1/7.
//  Copyright © 2017年 SR. All rights reserved.
//

#import "FishViewController.h"

@interface FishViewController ()

@end

@implementation FishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor randomColor];
    
    NSArray *languages = @[@"PHP", @"Objective-C", nil, @"Swift", @"Python"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
