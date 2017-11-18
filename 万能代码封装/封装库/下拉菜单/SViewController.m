
//
//  SViewController.m
//  pullDownMenu
//
//  Created by HYS on 16/9/23.
//  Copyright © 2016年 HYS. All rights reserved.
//

#import "SViewController.h"
#import "SPullDownMenuView.h"
@interface SViewController ()<UITableViewDataSource, UITableViewDelegate, SPullDownMenuViewDelegate>
@property (weak, nonatomic) UITableView *tableView;
@property (nonatomic, strong) SPullDownMenuView *menu;
@property (strong, nonatomic) NSIndexPath *index;
@property (nonatomic, strong) NSArray *titleA;
@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}
- (void)createUI{
    self.titleA = @[@[@"综合排序", @"价格从低到高", @"价格从高到底", @"信用排序"], @[@"销量优先",@"销量优先1",@"销量优先2"]];
    self.menu = [[SPullDownMenuView alloc] initWithFrame:CGRectMake(0, navHeight, [UIScreen mainScreen].bounds.size.width, 30) withTitle:self.titleA withSelectColor:MColor(241, 125,174)];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30+navHeight, _menu.frame.size.width, [UIScreen mainScreen].bounds.size.width - 60) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [[self.titleA objectAtIndex:self.index.row] objectAtIndex:self.index.section];
    return cell;
}


- (void)pullDownMenuView:(SPullDownMenuView *)menu didSelectedIndex:(NSIndexPath *)indexPath{
    self.index = indexPath;
    [self.tableView reloadData];
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
