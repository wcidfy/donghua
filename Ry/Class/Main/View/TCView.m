//
//  TCView.m
//  Ry
//
//  Created by lxx on 16/3/31.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TCView.h"
#import "MyButton.h"
@interface TCView()
@property(nonatomic,strong)MyButton *myBut;
@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UIButton *exitBut;
@end;
@implementation TCView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.8];

        _imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
        _imageV.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:_imageV];
            NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
            NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"发链接"];
        NSInteger maxCols = 3;
        CGFloat buttonW = 70;
        CGFloat buttonH = 100;
        CGFloat startY = SCREEN_HEIGHT*0.4;
        CGFloat startX = 20;
        CGFloat margin = (SCREEN_WIDTH - 2*startX - maxCols*buttonW) / 2;
        for (NSInteger i = 0; i<images.count; i++) {
            MyButton *btn = [MyButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            NSInteger row = i / maxCols;//计算行
            NSInteger col = i % maxCols;//计算列
            CGFloat buttonX = startX + col * (buttonW+margin);
            CGFloat buttonY = startY + row * (buttonH + 20);
            btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            [self addSubview:btn];
            [self setAnimation:btn];
          
            [UIView animateWithDuration:0.02 animations:^{
                [self layoutSubviews];
            }];
            }
        
        _exitBut=[UIButton buttonWithType:UIButtonTypeCustom];
        [_exitBut setTitle:@"取消" forState:UIControlStateNormal];
        [_exitBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_exitBut addTarget:self action:@selector(exitButClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_exitBut];
        
    }
    return self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _imageV.frame=CGRectMake(0, self.bounds.size.height*0.2, self.bounds.size.width, 20);
    
    _exitBut.frame=CGRectMake(self.bounds.size.width/2-25, self.bounds.size.height-70, 50,50);
    



}
-(void)exitButClick
{
    for (NSInteger i = 0; i<self.subviews.count; i++) {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:[MyButton class]]) {
            [UIView animateWithDuration:0.3 delay:0.05*i options:UIViewAnimationOptionTransitionCurlUp animations:^{
                view.y = 1000;
            } completion:^(BOOL finished) {
            }];
      }
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.imageV.y = 800;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
   


}
//设置动画
-(void)setAnimation:(UIView *)button {
    //按钮动画
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            button.transform = CGAffineTransformMakeScale(0.1,0.1);;
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                button.transform = CGAffineTransformMakeScale(1,1);
                
            } completion:^(BOOL finished) {
                //标语动画
                [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:5 options:UIViewAnimationOptionTransitionCurlDown animations:^{
                    self.imageV.centerY = SCREEN_HEIGHT*0.2;
                    [self layoutIfNeeded];
                } completion:nil];
                
            }];
        }];
    }];
}
@end
