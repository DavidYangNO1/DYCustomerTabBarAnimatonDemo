//
//  QTTabController.m
//  DYCustomerTabBarAnimatonDemo
//
//  Created by DavidYang on 16/6/5.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import "QTTabController.h"
#import "QTMacro.h"

@interface QTTabController ()
{
     BOOL isFirst;
}
@end

@implementation QTTabController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = self;
        isFirst = true;
        UIViewController * nav1 = [self addPlaceholdController];
        UIViewController * nav2 = [self addPlaceholdController];
        UIViewController * nav3 = [self addPlaceholdController];
        UIViewController * nav4 = [self addPlaceholdController];
        UIViewController * nav5 = [self addPlaceholdController];
    
        NSArray *vcs = @[nav1,
                         nav2,
                         nav3,
                         nav4,
                         nav5
                         ];
        [self setViewControllers:vcs];
        
        self.cusTabBar = [[QTTabBar alloc]init];
        [self setValue:self.cusTabBar forKey:@"tabBar"];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(isFirst){
        [self.cusTabBar setDefaultStatus];
        isFirst = false;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSLog(@"index is %d",(int)tabBarController.selectedIndex);
    if (tabBarController.selectedIndex == 2) {
        return;
    }else{
        self.lastIndex = (int)tabBarController.selectedIndex;
        [self.cusTabBar startAnimationByIndex:(int)tabBarController.selectedIndex];
    }
}

-(UIViewController*)addPlaceholdController{
    
    UIViewController * placeholdController = [[UIViewController alloc] init];;
    placeholdController.view.backgroundColor= QTCommonColorHex(0x70C7C0);
    return  placeholdController;
    
}

@end
