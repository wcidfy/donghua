//
//  LxTabBarController.m
//  Ry
//
//  Created by lxx on 16/3/31.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LxTabBarController.h"
#import "LxNavigationController.h"
#import "ZXViewController.h"
#import "JHViewController.h"
#import "GZViewController.h"
#import "WOViewController.h"
#import "LxTabBar.h"
@interface LxTabBarController ()

@end

@implementation LxTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addControllers];
    [self setValue:[[LxTabBar alloc]init] forKey:@"tabBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 添加子控制器
-(void)addControllers
{
    [self setcontroller:[[ZXViewController alloc] init] title:@"最新" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setcontroller:[[JHViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setcontroller:[[GZViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setcontroller:[[WOViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];





}

#pragma mark 设置控制器
-(void)setcontroller:(UIViewController *)vc title :(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{

    vc.tabBarItem.image=[UIImage imageNamed:image];
    vc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.title=title;
    vc.title=title;
    LxNavigationController *nav=[[LxNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    

}
@end
