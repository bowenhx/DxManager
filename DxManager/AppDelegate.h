//
//  AppDelegate.h
//  DxManager
//
//  Created by Stray on 16/9/4.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)getAppDelegate;
- (void)showLoginVC;

@end

