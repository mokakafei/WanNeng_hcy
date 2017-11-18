//
//  TanChuangShiTuZZDZViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/13.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "TanChuangShiTuZZDZViewController.h"
#import "LQPopUpView.h"

@interface TanChuangShiTuZZDZViewController ()
@property (strong, nonatomic)  UISegmentedControl *segmentControl;

@end

@implementation TanChuangShiTuZZDZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_White;
    NSArray *arr = [[NSArray alloc]initWithObjects:@"Alert",@"ActionSheet", nil];
    //先创建一个数组用于设置标题
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:arr];
    //在没有设置[segment setApportionsSegmentWidthsByContent:YES]时，每个的宽度按segment的宽度平分
    segmentControl.frame = CGRectMake(0, 100, 320-100, 40);
    self.segmentControl = segmentControl;
    self.segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.segmentControl];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:0];
    button.backgroundColor = RGB_Green;
    button.frame = CGRectMake(0, 150, 320-100, 40);
    [button setTitle:@"one" forState:BtnNormal];
    button.tag = 1000;
    [button addTarget:self action:@selector(change:) forControlEvents:BtnTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *buttonTwo = [UIButton buttonWithType:0];
    buttonTwo.backgroundColor = RGB_Green;
    buttonTwo.frame = CGRectMake(0, 200, 320-100, 40);
    [buttonTwo setTitle:@"two" forState:BtnNormal];
    buttonTwo.tag = 1001;
    [buttonTwo addTarget:self action:@selector(change:) forControlEvents:BtnTouchUpInside];
    [self.view addSubview:buttonTwo];
    
    
    
    
    UIButton *buttonThree = [UIButton buttonWithType:0];
    buttonThree.backgroundColor = RGB_Green;
    buttonThree.frame = CGRectMake(0, 250, 320-100, 40);
    [buttonThree setTitle:@"three" forState:BtnNormal];
    buttonThree.tag = 1002;
    [buttonThree addTarget:self action:@selector(change:) forControlEvents:BtnTouchUpInside];
    [self.view addSubview:buttonThree];
    
    UIButton *buttonFoure = [UIButton buttonWithType:0];
    buttonFoure.backgroundColor = RGB_Green;
    buttonFoure.frame = CGRectMake(0, 300, 320-100, 40);
    [buttonFoure setTitle:@"four" forState:BtnNormal];
    buttonFoure.tag = 1003;
    [buttonFoure addTarget:self action:@selector(change:) forControlEvents:BtnTouchUpInside];
    [self.view addSubview:buttonFoure];

}


-(void)change:(UIButton *)button{
    if (button.tag == 1000) {
        LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"提示" message:@"这是用第一种初始化方法创建的弹出视图"];
        
        [popUpView addBtnWithTitle:@"取消" type:LQPopUpBtnStyleCancel handler:^{
            // do something...
        }];
        
        [popUpView addBtnWithTitle:@"确定" type:LQPopUpBtnStyleDefault handler:^{
            // do something...
        }];
        
        [popUpView showInView:self.view preferredStyle:self.segmentControl.selectedSegmentIndex];
        //    [popUpView showInView:self.view preferredStyle:0];

    }
    if (button.tag == 1001) {
        LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"提示" message:@"这是第二种创建方式，也是一种快捷创建方式，没有太多的代码分离，使用起来特别方便，而且你可以单独再次加入任何按钮" cancelButtonTitle:@"取消" otherButtonTitles:@[@"提示一次", @"提示两次", @"确定"] actionWithIndex:^(NSInteger index) {
            // do something...
        }];
        
        [popUpView addBtnWithTitle:@"单独加入的按钮" type:LQPopUpBtnStyleDestructive handler:^{
            // do something...
        }];
        
        [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];

    }
    if (button.tag == 1002) {
        LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitleConfiguration:^(TitleConfiguration *configuration) {
            configuration.text = @"提示";
        } messageConfiguration:^(MessageConfiguration *configuration) {
            configuration.text = @"这是第三种创建方式，这个创建方式可以对title和message的文本、字号、字体颜色、文本上下边距进行定制，随时适应您的需求";
            configuration.fontSize = 15.0;
            configuration.textColor = [UIColor purpleColor];
            configuration.bottom = 25.0;
        }];
        
        [popUpView addBtnWithTitle:@"取消" type:LQPopUpBtnStyleCancel handler:^{
            // do something...
        }];
        
        [popUpView addBtnWithTitle:@"我知道了" type:LQPopUpBtnStyleDestructive handler:^{
            // do something...
        }];
        
        [popUpView addBtnWithTitle:@"确定" type:LQPopUpBtnStyleDefault handler:^{
            // do something...
        }];
        [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];

    }
    
    if (button.tag == 1003) {
        LQPopUpView *popUpView = [[LQPopUpView alloc] initWithTitle:@"提示" message:@"在做账号密码登录时，可以选择这种方式"];
        __weak typeof(LQPopUpView) *weakPopUpView = popUpView;
        
        [popUpView addTextFieldWithPlaceholder:@"请输入您的账号/手机号/邮箱" text:nil secureEntry:NO];
        [popUpView addTextFieldWithPlaceholder:@"请输入您的密码" text:nil secureEntry:YES];
        [popUpView addTextFieldWithPlaceholder:@"请再次确认您的密码" text:nil secureEntry:YES];
        
        [popUpView addBtnWithTitle:@"取消" type:LQPopUpBtnStyleCancel handler:^{
            // do something...
        }];
        
        [popUpView addBtnWithTitle:@"确定" type:LQPopUpBtnStyleDefault handler:^{
            // do something...
            for (int i = 0; i < weakPopUpView.textFieldArray.count; i ++) {
                UITextField *tf = weakPopUpView.textFieldArray[i];
                NSLog(@"第%d个输入框的文字是：%@", i, tf.text);
            }
        }];
        [popUpView showInView:self.view preferredStyle:_segmentControl.selectedSegmentIndex];

    }
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
