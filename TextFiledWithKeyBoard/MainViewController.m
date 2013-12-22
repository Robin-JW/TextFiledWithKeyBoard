//
//  MainViewController.m
//  TextFiledWithKeyBoard
//
//  Created by Robin on 13-12-22.
//  Copyright (c) 2013年 gejw. All rights reserved.
//

#import "MainViewController.h"
#import "IQKeyBoardManager.h"
#import "iToast.h"

@interface MainViewController (){
    UITextField *textFiled;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(60, 100, 200, 30)];
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(showKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"显示键盘及输入框" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    //1.初始化
    [IQKeyBoardManager installKeyboardManager];
    //2.添加一个输入框   并让他不显示
    textFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:textFiled];
    //3.添加键盘上方输入框布局
    __unsafe_unretained UITextField *tf = textFiled;
    [textFiled addTextFiled:^(UITextField *mTextFiled) {
        //点击输入框的回车之后 回调回来的内容
        [[[iToast makeText:[NSString stringWithFormat:@"输入的内容：%@",mTextFiled.text]] setGravity:iToastGravityCenter] show];
        [tf resignFirstResponder];
    }];
}

-(void) showKeyboard:(id) sender{
    //4.显示键盘
    [textFiled becomeFirstResponder];
    
}

@end
