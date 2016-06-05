//
//  UITabBarItemView.m
//  QT
//
//  Created by DavidYang on 16/5/19.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import "UITabBarItemView.h"
#import "UIView+LayoutMethods.h"
#import "QTMacro.h"

@interface UITabBarItemView()
{
    UILabel * titleLbl;
    UIImageView * itemImageView;
}

@end

@implementation UITabBarItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI{
    self.isUP = true;
    self.isAnimationing = false;
    self.timeDurion = 0.3;
    titleLbl = [[UILabel alloc] initWithFrame:self.frame];
    titleLbl.backgroundColor = [UIColor whiteColor];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    titleLbl.textColor = QTCommonColorHex(0x999999);
    [self addSubview:titleLbl];
    
    itemImageView = [[UIImageView alloc] initWithFrame:self.frame];
    itemImageView.userInteractionEnabled = true;
    [self addSubview:itemImageView];
}

-(instancetype)initWithImageName:(NSString*)imgaName withTitle:(NSString*)title{
    self = [self initWithFrame:CGRectZero];
    if (self){
        titleLbl.text = title;
        itemImageView.image = [UIImage imageNamed:imgaName];
    }
    return self;
}

- (void)startUpAnimation{
    
    if (self.isAnimationing) {
        return;
    }
    
    if (self.isUP) {
        return;
    }
    
    self.isAnimationing = true;
    [UIView animateKeyframesWithDuration:self.timeDurion delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:self.timeDurion/3 animations:^{
            itemImageView.centerY -= 7;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:self.timeDurion/3 relativeDuration:self.timeDurion/3 animations:^{
            itemImageView.centerY -= 8;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:(self.timeDurion/3) * 2 relativeDuration:self.timeDurion/3 animations:^{
            itemImageView.centerY -= 10;
        }];
    } completion:^(BOOL finished) {
        self.isAnimationing = false;
        self.isUP = true;
    }];
}


- (void)startDownAnimation{
    
    if (self.isAnimationing) {
        return;
    }
    
    if(!self.isUP){
        return;
    }
    
    self.isAnimationing = true;
    [UIView animateKeyframesWithDuration:self.timeDurion delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:self.timeDurion/3 animations:^{
            itemImageView.centerY += 7;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:self.timeDurion/3 relativeDuration:self.timeDurion/3 animations:^{
            itemImageView.centerY += 8;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:(self.timeDurion/3) *2 relativeDuration:self.timeDurion/3 animations:^{
            itemImageView.centerY += 10;
        }];
    } completion:^(BOOL finished) {
        self.isAnimationing = false;
        self.isUP = false;
    }];
}


- (void)updateImageFrameFullFill{
     itemImageView.frame = CGRectMake(0, 0,self.width, self.height);
}


- (void)upateImageFrame{
    
    titleLbl.frame = CGRectMake(0, 0, self.width, self.height);
    itemImageView.frame = CGRectMake((self.width-46)/2, 5, 46, 54);
}


- (void)defaultStatus:(float)yPos{
    
    itemImageView.centerY += yPos;
    if(yPos==0){
        self.isUP = true;
    }
    else{
        self.isUP = false;
    }
}

@end

