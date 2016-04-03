//
//  GZViewController.m
//  Ry
//
//  Created by lxx on 16/3/31.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "GZViewController.h"
#import "LogView.h"
@interface GZViewController ()
@property(nonatomic,strong)LogView *logView;
@property(nonatomic,strong)UIButton *bu;

@end

@implementation GZViewController
+(void)initialize
{

}
-(void)loadView
{
    _logView=[[LogView alloc]init];
    self.view=_logView;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor grayColor];
    self.title=@"关注";
    
    _bu=[UIButton buttonWithType:UIButtonTypeCustom];
    [_bu setTitle:@"qwqwq" forState:UIControlStateNormal];
    
    [_bu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _bu.frame=CGRectMake(200, 350, 60, 40);
    [_bu addTarget:self action:@selector(buClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bu];
    
//点击输入区以外移除键盘
    UITapGestureRecognizer *tapGestureRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];

}
-(void)buClick
{
    if (_logView.viewWhile.x==0) {
        [UIView animateWithDuration:0.25 animations:^{
            _logView.viewWhile.x=-self.view.bounds.size.width;
            [self.view layoutIfNeeded];
        }];
        NSLog(@"0");
    }
    else
    {
        [UIView animateWithDuration:0.25 animations:^{
  _logView.viewWhile.x=0;
            [self.view layoutIfNeeded];
        }];

      
    
    }
    
    NSLog( @"d");
  
}
#pragma mark  移除键盘方法
-(void)keyboardHide
{
    [_logView.reUserTextfiled resignFirstResponder];
    [_logView.rePassTextfiled resignFirstResponder];

    [_logView.logUserTextfiled resignFirstResponder];
    [_logView.logPassTextfiled resignFirstResponder];
    



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
