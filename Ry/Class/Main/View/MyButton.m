//
//  MyButton.m
//  Ry
//
//  Created by lxx on 16/4/1.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        文字剧中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
//        图片等比显示
        [self setContentMode:UIViewContentModeScaleAspectFit];
    }

    return self;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH=contentRect.size.height*0.7;
    CGFloat titieH=contentRect.size.height-imageH;
    return CGRectMake(0, imageH, contentRect.size.width, titieH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{

    CGFloat imageH=contentRect.size.height*0.7;
    return CGRectMake(0, 0, contentRect.size.width, imageH);
}
@end
