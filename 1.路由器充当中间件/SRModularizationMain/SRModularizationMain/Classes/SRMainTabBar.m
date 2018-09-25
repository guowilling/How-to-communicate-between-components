//
//  SRMainTabBar.m
//  Pods-SRModularizationMain_Example
//
//  Created by Willing Guo on 2018/8/30.
//

#import "SRMainTabBar.h"

@interface SRMainTabBar ()

@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation SRMainTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.shadowImage = [SRMainTabBar imageWithColor:[UIColor clearColor]];
        
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [plusBtn addTarget:self action:@selector(plusBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        _plusBtn = plusBtn;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.plusBtn.frame = CGRectMake(0, 0, self.plusBtn.currentBackgroundImage.size.width, self.plusBtn.currentBackgroundImage.size.height);
    self.plusBtn.center = CGPointMake(self.center.x, self.frame.size.height * 0.5 - 20);
    
    UILabel *plusLabel = [[UILabel alloc] init];
    plusLabel.text = @"发布";
    plusLabel.textColor = [UIColor grayColor];
    plusLabel.font = [UIFont systemFontOfSize:12];
    plusLabel.textAlignment = NSTextAlignmentCenter;
    plusLabel.frame = _plusBtn.bounds;
    plusLabel.center = CGPointMake(self.plusBtn.center.x, CGRectGetMaxY(self.plusBtn.frame) + 10);
    [self addSubview:plusLabel];
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGRect frame = btn.frame;
            frame.size.width = self.frame.size.width / 5;
            frame.origin.x = frame.size.width * btnIndex;
            btn.frame = frame;
            btnIndex++;
            if (btnIndex == 2) {
                btnIndex++;
            }
        }
    }
    [self bringSubviewToFront:self.plusBtn];
}

- (void)plusBtnAction {
    if (self.didSelectMiddleItemBlock) {
        self.didSelectMiddleItemBlock();
    }
}

// 为了让凸出的部分点击也有反应重写hitTest方法
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 必须判断, 任何界面发生点击事件都是会调用这个方法的.
    if (self.isHidden == NO) { // 当前页面tabbar没有隐藏, 那么肯定是在导航控制器的根控制器页面.
        // 当前tabbar的触摸点转换到发布按钮的身上.
        CGPoint newPoint = [self convertPoint:point toView:self.plusBtn];
        // 如果转换后的点是在发布按钮身上, 那么处理点击事件最合适的view就是发布按钮.
        if ([self.plusBtn pointInside:newPoint withEvent:event]) {
            return self.plusBtn;
        } else { // 如果不在发布按钮身上, 直接让系统处理就可以了.
            return [super hitTest:point withEvent:event];
        }
    } else { // tabbar隐藏了, 说明已经push到其他的页面了直接让系统处理就可以了.
        return [super hitTest:point withEvent:event];
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

- (void)setMiddleItemBackgroundImage:(UIImage *)img {
    [_plusBtn setBackgroundImage:img forState:UIControlStateNormal];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setItemSelectedTitleAttributes:(NSDictionary *)attributes {
//    UITabBarItem *tabBarItemAppearance = [UITabBarItem appearanceWhenContainedIn:self, nil]; // crash
//    UITabBarItem *tabBarItemAppearance = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]]; // crash
    UITabBarItem *tabBarItemAppearance = [UITabBarItem appearance];
    [tabBarItemAppearance setTitleTextAttributes:attributes forState:UIControlStateSelected];
}

@end
