//
//  UITabBarItemView.h
//  QT
//
//  Created by DavidYang on 16/5/19.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  CustomerTabBarItemView
 */
@interface UITabBarItemView : UIView

@property(nonatomic,assign) BOOL isUP;
@property(nonatomic,assign) float timeDurion;
@property(nonatomic,assign) BOOL isAnimationing;
-(instancetype)initWithImageName:(NSString*)imgaName withTitle:(NSString*)title;

- (void)startDownAnimation;
- (void)startUpAnimation;

- (void)defaultStatus:(float)yPos;


- (void)updateImageFrameFullFill;
- (void)upateImageFrame;
@end
