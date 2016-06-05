//
//  AppDelegate+UIHelper.h
//  QT
//
//  Created by DavidYang on 16/4/25.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AppDelegate(UIHelper)

/**
 *  切换到首页
 */
-(void)switchToMainView;

/**
 *  切换到登录
 */
-(void)switchToLogin;

/**
 *  切换到注册
 */
-(void)switchToRegis;


/**
 *  入口
 */
-(void)dispatchModule;

@end
