//
//  AppDelegate+UIHelper.m
//  QT
//
//  Created by DavidYang on 16/4/25.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import "AppDelegate+UIHelper.h"
#import "QTTabController.h"
#import "QTMacro.h"

@implementation AppDelegate(UIHelper)

#pragma UI Module


-(void)transferToController:(UIViewController*)controller{
    
    if (self.window.rootViewController){
        
        [UIView transitionWithView:self.window duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionAllowAnimatedContent animations:^{
            BOOL oldState = [UIView areAnimationsEnabled];
            [UIView setAnimationsEnabled:NO];
            self.window.rootViewController = controller;
            [UIView setAnimationsEnabled:oldState];
        } completion:nil];
        
    } else {
        self.window.rootViewController = controller;
    }

}

-(void)switchToMainView{
    
    [self configThem];
    
    QTTabController * tabControl = [QTTabController new];
    [self transferToController:tabControl];
    
}

- (void)configThem{
    
       // 导航条的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    // 导航条上UIBarButtonItem颜色
    //[[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    
    // 导航条上标题的颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : QTCommonColorHex(0xA7BDB1)}];

}


-(void)dispatchModule{
    [self switchToMainView];    
}
@end
