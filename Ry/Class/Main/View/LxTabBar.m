//
//  LxTabBar.m
//  Ry
//
//  Created by lxx on 16/3/31.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LxTabBar.h"
#import "TCView.h"
@interface LxTabBar()
@property (nonatomic,strong) UIButton *publishBtn;
@end
@implementation LxTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        //设置tabbar的文字颜色
        UITabBarItem *appearance = [UITabBarItem appearance];
        [appearance setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName : [UIColor redColor]}
                                  forState:UIControlStateSelected];
        [appearance setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName : [UIColor grayColor]}
                                  forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishBtn.size = publishBtn.currentBackgroundImage.size;
        [[publishBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//            XFPublishView *publishView = [XFPublishView publishView];
//            publishView.frame = SCREEN_FRAME;
//            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//            [keyWindow addSubview:publishView];
            TCView *tcview=[[TCView alloc]init];
            tcview.frame=[[UIScreen mainScreen]bounds];
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
           [keyWindow addSubview:tcview];
//            NSLog(@"123213");
           
        }];

     
        self.publishBtn = publishBtn;
        [self addSubview:_publishBtn];
        
    }


    return self;
}
//重新设置按钮的位置
-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    NSInteger index = 0;
    CGFloat btnW = width / 5;
    CGFloat btnH = height;
    CGFloat btnY = 0;
    
    //发布按钮位置
    self.publishBtn.center = CGPointMake(width/2, height/2);
    //遍历取出按钮
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]] || view == self.publishBtn) continue; {
            
            CGFloat btnX = (index > 1 ? (index +1) : index) *btnW;
            
            view.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index++;
        }
    }
    
}

@end
