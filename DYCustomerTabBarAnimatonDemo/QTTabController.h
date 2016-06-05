//
//  QTTabController.h
//  DYCustomerTabBarAnimatonDemo
//
//  Created by DavidYang on 16/6/5.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QTTabBar.h"

@interface QTTabController : UITabBarController<UITabBarControllerDelegate>

@property(nonatomic,assign) int lastIndex;
@property(nonatomic,strong) QTTabBar * cusTabBar;

@end
