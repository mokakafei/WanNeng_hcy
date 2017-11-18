//
//  SJYHSYViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/8/20.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "SJYHSYViewController.h"
#import "BtnModel.h"
#import "FTT_Roundview.h"
@interface SJYHSYViewController ()
@property (nonatomic , strong) UIButton *button;
@property (nonatomic , strong) FTT_Roundview *romate ;
@property (nonatomic , strong) NSMutableArray *datasource ;
@end

@implementation SJYHSYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FTT_Roundview *romate = [[FTT_Roundview alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    romate.center = self.view.center;
    self.romate = romate;
    _datasource = [NSMutableArray new];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"BtnList.plist" ofType:nil];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *item  in contentArray) {
        BtnModel *model = [[BtnModel alloc]init];
        [model setValuesForKeysWithDictionary:item];
        [_datasource addObject:model];
    }
    NSMutableArray *titleArray = [NSMutableArray new];
    NSMutableArray *imageArray = [NSMutableArray new];
    for (BtnModel *model  in _datasource) {
        
        [titleArray addObject:model.title];
        [imageArray addObject:model.Image1];
        
    }
    [romate BtnType:FTT_RoundviewTypeCustom BtnWitch:100 adjustsFontSizesTowidth:YES msaksToBounds:YES conrenrRadius:50 image:imageArray TitileArray:titleArray titileColor:[UIColor blackColor]];
    __weak SJYHSYViewController *weakself = self;
    romate.back = ^(NSInteger num ,NSString *name ) {
        [weakself pushView:num name:name];
        XMGLog(@"在这里做跳转页面的跳转");
//        BaseViewController *vc = [[BaseViewController alloc]init];
//        vc.title = name;
//        [self.navigationController pushViewController:vc animated:YES];
        
    };
    [self.view addSubview:romate];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _button.center = self.view.center;
    _button.backgroundColor = [UIColor yellowColor];
    _button.layer.cornerRadius = 50;
    [_button addTarget:self action:@selector(showItems:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
}
- (void)showItems:(UIButton *)sender{
    [_romate show];
    
    
}
// 跳转界面
- (void)pushView:(NSInteger)num name:(NSString *)name {
    NSMutableArray *classArray = [NSMutableArray new];
    for (BtnModel *model  in _datasource) {
        [classArray addObject:model.ClassName];
    }
//    Class class = NSClassFromString(classArray[num]);
//    BaseViewController *vc = [[class alloc]init];
//    vc.title = name;
//    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
