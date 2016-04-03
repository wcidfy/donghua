//
//  ZXViewController.m
//  Ry
//
//  Created by lxx on 16/3/31.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ZXViewController.h"
#import "GZViewController.h"
@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];

    
    UIButton *butt=[UIButton buttonWithType:UIButtonTypeCustom];
    butt.backgroundColor=[UIColor purpleColor];
    butt.frame=CGRectMake(100, 100, 100, 60);
    [butt setTitle:@"点击" forState:UIControlStateNormal];
    [butt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[butt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        GZViewController *g=[GZViewController new];
        [self.navigationController pushViewController:g animated:YES];
    }];
    [self.view addSubview:butt];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
