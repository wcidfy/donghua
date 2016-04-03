//
//  LogView.h
//  Ry
//
//  Created by lxx on 16/4/2.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogView : UIView<UITextFieldDelegate>
/**
 *  白色视图
 */
@property(nonatomic,strong)UIView *viewWhile;
/**
 *  登录用户名
 */
@property(nonatomic,strong)UITextField *logUserTextfiled;
/**
 *  登录密码
 */
@property(nonatomic,strong)UITextField *logPassTextfiled;
/**
 *  登录按钮
 */
@property(nonatomic,strong)UIButton *logButton;
/**
 *  注册输入电话
 */
@property(nonatomic,strong)UITextField *reUserTextfiled;
/**
 *  注册密码
 */
@property(nonatomic,strong)UITextField *rePassTextfiled;
/**
 *  注册按钮
 */
@property(nonatomic,strong)UIButton *reButton;

@end
