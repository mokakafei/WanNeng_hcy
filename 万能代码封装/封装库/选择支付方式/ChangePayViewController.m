//
//  ChangePayViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/8/10.
//  Copyright © 2017年 hcy. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ChangePayViewController.h"
#import "Masonry.h"
#import "PayMethodViewController.h"
#import "STPopupController.h"

@interface ChangePayViewController ()<PayMethodSelectionViewControllerDelegate>
@property (nonatomic)UILabel *payWayLabel;
@end

@implementation ChangePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

- (void)PayMethodSelectionViewControllerBackWithpayName:(NSString *)payname{
    self.payWayLabel.text = payname;
    NSLog(@"%@",payname);
}

- (void)initView {
    self.payWayLabel = [[UILabel alloc]init];
    self.payWayLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.payWayLabel];
    [self.payWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view.mas_left).offset(36);
        make.right.equalTo(self.view.mas_right).offset(-36);
        make.height.equalTo(@20);
    }];
    
    
    UIView *topBorderView = [[UIView alloc] init];
    topBorderView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    [self.view addSubview:topBorderView];
    [topBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(190);
        make.left.equalTo(self.view.mas_left).offset(24);
        make.right.equalTo(self.view.mas_right).offset(-24);
        make.height.equalTo(@0.7);
    }];
    
    UIView *bottomBorderView = [[UIView alloc] init];
    bottomBorderView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    [self.view addSubview:bottomBorderView];
    [bottomBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.payWayLabel.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(24);
        make.right.equalTo(self.view.mas_right).offset(-24);
        make.height.equalTo(@0.7);
    }];
    
    UIButton * openBtn = [[UIButton alloc]init];
    openBtn.backgroundColor = UIColorFromRGB(0xf4054e);
    openBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [openBtn setTitle:@"确定" forState:UIControlStateNormal];
    [openBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [openBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openBtn];
    [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.height.equalTo(@30);
        make.width.equalTo(@60);
        
    }];
}

- (void)btnClick:(UIButton *)btn{
    PayMethodViewController *vc = [[PayMethodViewController alloc]init];
    vc.delegate = self;
    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:vc];
    popupController.style = STPopupStyleBottomSheet;
    popupController.navigationBarHidden = YES;
    [popupController presentInViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
