//
//  ButtonPaiBanViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/8/13.
//  Copyright © 2017年 hcy. All rights reserved.
//
#import "ButtonPaiBanViewController.h"
//当前屏幕的宽高
#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)

@interface ButtonPaiBanViewController ()<UITextFieldDelegate>
{
    UIView *remenView;
}


@end

@implementation ButtonPaiBanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTitlebar];
    
    [self setreMenUI];
}

-(void)setreMenUI{
    
    remenView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+navHeight, CurrentWidth, CurrentHeight-64)];
    remenView.backgroundColor = [UIColor whiteColor];
    remenView.userInteractionEnabled = YES;
    [self.view addSubview:remenView];
    
    
    
    //================
    
    UIImageView *shuimg= [[UIImageView alloc]initWithFrame:CGRectMake(15, 17, 3, 20)];
    shuimg.backgroundColor = [UIColor greenColor];
    [remenView addSubview:shuimg];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shuimg.frame)+10, CGRectGetMinY(shuimg.frame), 200, 20)];
    lab.text = @"热门搜索";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:13];
    [remenView addSubview:lab];
    
    NSArray *tarr = @[@"盗墓笔记",@"空空道人谈股市",@"叶文有话要说",@"相声",@"二货一箩筐",@"单田方",@"城市",@"美女",@"社交恐惧",@"家庭矛盾",@"失恋",@"局势很简单",@"Word",@"美女",@"美女与野兽",@"体育",@"生化危机"];
    
    float butX = 15;
    float butY = CGRectGetMaxY(shuimg.frame)+10;
    for(int i = 0; i < tarr.count; i++){
        
        //宽度自适应
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGRect frame_W = [tarr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
        
        if (butX+frame_W.size.width+20>CurrentWidth-15) {
            
            butX = 15;
            
            butY += 55;
        }
        
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(butX, butY, frame_W.size.width+20, 40)];
        [but setTitle:tarr[i] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(searchContent:) forControlEvents:UIControlEventTouchUpInside];
        [but setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:13];
        but.layer.cornerRadius = 8;
        but.layer.borderColor = [UIColor lightGrayColor].CGColor;
        but.layer.borderWidth = 1;
        [remenView addSubview:but];
        
        butX = CGRectGetMaxX(but.frame)+10;
        
    }
    
}


-(void)searchContent:(UIButton *)button{
    NSLog(@"搜索的内容是: %@", button.titleLabel.text);
}


-(void)setTitlebar{
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0+navHeight, CurrentWidth, 20)];
    statusBarView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:statusBarView];
    
    UIView *tbg = [[UIView alloc]initWithFrame:CGRectMake(0, 20+navHeight, CurrentWidth, 44)];
    tbg.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tbg];
    
    tbg.userInteractionEnabled = YES;
    
    UIImageView *bgimg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, CurrentWidth-44-15, 30)];
    bgimg.backgroundColor = [UIColor whiteColor];
    bgimg.layer.cornerRadius = 15;
    bgimg.layer.borderColor = [[UIColor grayColor] CGColor];
    bgimg.layer.borderWidth = 1;
    [bgimg.layer setMasksToBounds:YES];
    bgimg.userInteractionEnabled = YES;
    [tbg addSubview:bgimg];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 16, 16)];
    img.image = [UIImage imageNamed:@"common_btn_search"];
    [bgimg addSubview:img];
    
    
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(img.frame)+10, 2, bgimg.frame.size.width-40, 26)];
    text.placeholder = @"请输入搜索关键字";
    text.textColor = [UIColor blackColor];
    text.font = [UIFont systemFontOfSize:14];
    text.delegate = self;
    text.returnKeyType = UIReturnKeySearch;
    [bgimg addSubview:text];
    
    UIButton *rightBut = [[UIButton alloc]initWithFrame:CGRectMake(CurrentWidth-50, 0, 50, 44)];
    [rightBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightBut.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBut setTitle:@"取消" forState:UIControlStateNormal];
    [rightBut addTarget:self action:@selector(rightmengbutClick) forControlEvents:UIControlEventTouchUpInside];
    rightBut.titleLabel.textAlignment = NSTextAlignmentCenter;
    [tbg addSubview:rightBut];
    
    
    //------
    UIImageView *hximg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64-1, CurrentWidth, 1)];
    hximg.backgroundColor = [UIColor grayColor];
    [self.view addSubview:hximg];
}

// return按钮操作
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    
    NSLog(@"----1111-----");
    
    return YES;
}


-(void)rightmengbutClick{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
