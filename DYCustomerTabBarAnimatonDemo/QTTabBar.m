//
//  QTTabBar.m
//  QT
//
//  Created by Heisenbean on 16/5/12.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import "QTTabBar.h"
#import "UITabBarItemView.h"
#import "UIView+LayoutMethods.h"

@interface QTTabBar()
{
    NSMutableArray * listTabItemViewArr;
    UITabBarItemView * centerItem;
}

@end

@implementation QTTabBar


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}


-(void)setup{
   
    self.translucent = NO;
    self.barTintColor = [UIColor whiteColor];

    listTabItemViewArr = [NSMutableArray arrayWithCapacity:4];
    UITabBarItemView * itemView1 = [[UITabBarItemView alloc] initWithImageName:[NSString stringWithFormat:@"interface_functionswitch_a_1"] withTitle:@"首页"];
    
    [self addSubview:itemView1];
    [listTabItemViewArr addObject:itemView1];
    
    UITabBarItemView * itemView2 = [[UITabBarItemView alloc] initWithImageName:[NSString stringWithFormat:@"interface_functionswitch_b_1"] withTitle:@"发现"];
   
    [self addSubview:itemView2];
    [listTabItemViewArr addObject:itemView2];
    
    UITabBarItemView * itemView3 = [[UITabBarItemView alloc] initWithImageName:[NSString stringWithFormat:@"interface_functionswitch_c_1"] withTitle:@"通知"];
    
    [self addSubview:itemView3];
    [listTabItemViewArr addObject:itemView3];
    
    UITabBarItemView * itemView4 = [[UITabBarItemView alloc] initWithImageName:[NSString stringWithFormat:@"interface_functionswitch_d_1"] withTitle:@"我的"];
    
    [self addSubview:itemView4];
    [listTabItemViewArr addObject:itemView4];
    
    centerItem = [[UITabBarItemView alloc] initWithImageName:[NSString stringWithFormat:@"interface_functionswitch_create"] withTitle:@""];
    [self addSubview:centerItem];
    
}



- (void)setDefaultStatus{
    
    for (int i=0; i<listTabItemViewArr.count; i++) {
        UITabBarItemView * curItemView = [listTabItemViewArr objectAtIndex:i];
        if(i==0)
        {
            [curItemView defaultStatus:0];
        }
        else{
            [curItemView defaultStatus:25];
        }
    }

}

- (void)startAnimationByIndex:(int)index{

    if(index>2){
        index--;
    }

    for (int i=0; i<listTabItemViewArr.count; i++) {
        UITabBarItemView * curItemView = [listTabItemViewArr objectAtIndex:i];
        if(i==index)
        {
            [curItemView startUpAnimation];
        }
        else{
            [curItemView startDownAnimation];
        }
    }
}


- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event{
    for (int i=0; i<listTabItemViewArr.count; i++) {
        UITabBarItemView * curItemView = [listTabItemViewArr objectAtIndex:i];
        if (curItemView.isAnimationing) {
            return self;
        }
    }
    return [super hitTest:point withEvent:event];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
   
    CGFloat btnW =self.width /5;
    CGFloat btnH =self.height;

    for(int i=0;i<listTabItemViewArr.count;i++){
        UITabBarItemView * itemView = [listTabItemViewArr objectAtIndex:i];
        if(i<2){
            itemView.frame = CGRectMake(i*btnW, 0, btnW, btnH);
            
        }else{
            itemView.frame = CGRectMake((i+1)*btnW, 0, btnW, btnH);
        }
        [itemView upateImageFrame];
    }
    
    centerItem.frame = CGRectMake(2*btnW, 0, btnW, btnH);
    [centerItem updateImageFrameFullFill];
}
@end
