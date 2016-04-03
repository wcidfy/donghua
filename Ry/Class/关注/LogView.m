//
//  LogView.m
//  Ry
//
//  Created by lxx on 16/4/2.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LogView.h"

@implementation LogView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
                _viewWhile=[[UIView alloc]init];
        _viewWhile.backgroundColor=[UIColor whiteColor];
        [self setAnimation:_viewWhile];
        [self addSubview:_viewWhile];
        
        _logUserTextfiled=[self getTextFile];
        _logUserTextfiled.placeholder=@"请输入用户名";
        [self rectView:_logUserTextfiled];
        [_viewWhile addSubview:_logUserTextfiled];
        
        _logPassTextfiled=[self getTextFile];
        _logPassTextfiled.placeholder=@"请输入密码";
        [self rectView:_logPassTextfiled];
        [_viewWhile addSubview:_logPassTextfiled];
        
        _logButton=[self getButton];
        [_logButton setTitle:@"登录" forState:UIControlStateNormal];
        [self rectView:_logButton];
        [_viewWhile addSubview:_logButton];
        
        _reUserTextfiled=[self getTextFile];
        _reUserTextfiled.placeholder=@"请输入电话号码";
        [self rectView:_reUserTextfiled];
        [_viewWhile addSubview:_reUserTextfiled];
        _rePassTextfiled=[self getTextFile];
        _rePassTextfiled.placeholder=@"请输入密码";
        [self rectView:_rePassTextfiled];
        [_viewWhile addSubview:_rePassTextfiled];
        
        
        _reButton=[self getButton];
        [_reButton setTitle:@"注册" forState:UIControlStateNormal];
        [self rectView:_reButton];
        [_viewWhile addSubview:_reButton];
        
        
    }

    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _viewWhile.frame=CGRectMake(0, 20, self.bounds.size.width*2, 250);
    _logUserTextfiled.frame=CGRectMake(20,80, self.bounds.size.width-40, 40);
    _logPassTextfiled.frame=CGRectMake(_logUserTextfiled.x,_logUserTextfiled.y+60, self.bounds.size.width-40, 40);
    _logButton.frame=CGRectMake(_logUserTextfiled.x, _logPassTextfiled.y+60, self.bounds.size.width-40, 40);
    
    _reUserTextfiled.frame=CGRectMake(self.bounds.size.width+20, 80, self.bounds.size.width-40, 40);
     _rePassTextfiled.frame=CGRectMake(_reUserTextfiled.x,_reUserTextfiled.y+60, self.bounds.size.width-40, 40);
    _reButton.frame=CGRectMake(_reUserTextfiled.x, _rePassTextfiled.y+60, self.bounds.size.width-40, 40);

}
#pragma mark 给uiview画圆角
-(void)rectView:(UIView *)view
{
    view.layer.masksToBounds=YES;
    view.layer.cornerRadius=10;



}
#pragma mark 移除键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    return YES;

}

#pragma mark 输入框初始化方法
-(UITextField *)getTextFile
{
    UITextField *tf=[[UITextField alloc]init];
    tf.backgroundColor=[UIColor grayColor];
    tf.textAlignment=NSTextAlignmentCenter;
    tf.textColor=[UIColor redColor];
    tf.delegate=self;
    return tf;

}
#pragma mark 按钮初始化
-(UIButton *)getButton
{
    UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
    bu.backgroundColor=[UIColor orangeColor];
    [bu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    
    
    NSLog(@"dss");
    return bu;
}
//设置动画
-(void)setAnimation:(UIView *)button {
    //按钮动画
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        button.transform=CGAffineTransformMakeScale(0.5, 0.5);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            button.transform=CGAffineTransformMakeScale(1, 1);

             _viewWhile.y=10;
        } completion:^(BOOL finished) {

        }];
    }];
}

@end
