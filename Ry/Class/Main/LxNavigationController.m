//
//  LxNavigationController.m
//  Ry
//
//  Created by lxx on 16/3/31.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LxNavigationController.h"

@interface LxNavigationController ()
@property (nonatomic,strong) UIButton *backBtn;

@end

@implementation LxNavigationController
+(void)initialize
{
    UINavigationBar *bar=[UINavigationBar appearance];
//    设置字体颜色
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
//    设置背景图
    [bar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"] forBarMetrics:UIBarMetricsDefault];
//    去掉黑线
    [bar setShadowImage:[[UIImage alloc]init]];
}


//拦截push进来的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) {
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //如果在控制器有设置，就可以让后面设置的按钮可以覆盖它
    [super pushViewController:viewController animated:animated];
}

- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [_backBtn sizeToFit];
        [[_backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self popViewControllerAnimated:YES];
        }];
    }
    return _backBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
