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
     //4.显示键盘
    [textFiled becomeFirstResponder];
    
    
    ![image](http://git.oschina.net/gejw0623/TextFiledWithKeyBoard/blob/master/TextFiledWithKeyBoard/screen.jpg)