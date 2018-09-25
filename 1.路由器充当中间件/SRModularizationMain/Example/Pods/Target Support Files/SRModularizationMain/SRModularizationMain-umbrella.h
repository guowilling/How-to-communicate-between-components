#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SRMainModulAPI.h"
#import "SRMainNavigationBar.h"
#import "SRMainNavigationController.h"
#import "SRMainRouter.h"
#import "SRMainTabBar.h"
#import "SRMainTabBarController.h"

FOUNDATION_EXPORT double SRModularizationMainVersionNumber;
FOUNDATION_EXPORT const unsigned char SRModularizationMainVersionString[];

