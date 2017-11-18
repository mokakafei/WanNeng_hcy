//
//  KYXTDFDXZQViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/9/10.
//  Copyright © 2017年 hcy. All rights reserved.
//
#import "KYXTDFDXZQViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "UIColor+Tools.h"
#import "JohnTopTitleView.h"
#import "ViewController3.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

const CGFloat headerH = 200;

@interface KYXTDFDXZQViewController ()<JohnTopTitleViewDelegate>

@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) ViewController1 *vc1;
@property (nonatomic,strong) ViewController2 *vc2;
@property (nonatomic,strong) ViewController3 *vc3;
@property (nonatomic,strong) JohnTopTitleView *topTitleView;

@end

@implementation KYXTDFDXZQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    [self setting];
    
}

- (void)setting{
    
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, headerH)];
    self.headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headerView];
    
    [self.view addSubview:self.topTitleView];
}

#pragma mark - CustomDelegate
- (void)johnScrollViewDidScroll:(CGFloat)scrollY{
    CGFloat headerViewY;
    if (scrollY > 0) {
        headerViewY = -scrollY + 64;
        if (scrollY > headerH) {
            headerViewY = -headerH + 64;
        }
    }else{
        headerViewY = 64;
    }
    self.headerView.frame = CGRectMake(0,headerViewY, kScreenW, headerH);
    self.topTitleView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), kScreenW, kScreenH - CGRectGetMaxY(self.headerView.frame));
}

#pragma mark - JohnTopTitleViewDelegate
- (void)didSelectedPage:(NSInteger)page{
    self.headerView.frame = CGRectMake(0, 64, kScreenW, headerH);
    self.topTitleView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), kScreenW, kScreenH - CGRectGetMaxY(self.headerView.frame));
    switch (page) {
        case 0:
        {
            [self.vc2.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
            [self.vc3.collectionView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
            break;
        case 1:
        {
            [self.vc1.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
            [self.vc3.collectionView setContentOffset:CGPointMake(0, 0) animated:NO];
            
        }
            break;
        default:
        {
            [self.vc1.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
            [self.vc2.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
            
        }
            break;
    }
}

#pragma mark - Getter
- (JohnTopTitleView *)topTitleView{
    if (!_topTitleView) {
        _topTitleView = [[JohnTopTitleView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.headerView.frame), kScreenW, kScreenH - 64)];
        _topTitleView.titles = @[@"我的空间",@"我的访客",@"我访问的"];
        [_topTitleView setupViewControllerWithFatherVC:self childVC:@[self.vc1,self.vc2,self.vc3]];
        _topTitleView.delegete = self;
    }
    return _topTitleView;
}

- (ViewController1 *)vc1{
    if (!_vc1) {
        _vc1 = [[ViewController1 alloc]init];
        __weak typeof(self) weakSelf = self;
        _vc1.DidScrollBlock = ^(CGFloat scrollY) {
            [weakSelf johnScrollViewDidScroll:scrollY];
        };
    }
    return _vc1;
}

- (ViewController2 *)vc2{
    if (!_vc2) {
        _vc2 = [[ViewController2 alloc]init];
        __weak typeof(self) weakSelf = self;
        _vc2.DidScrollBlock = ^(CGFloat scrollY) {
            [weakSelf johnScrollViewDidScroll:scrollY];
        };
    }
    return _vc2;
}

- (ViewController3 *)vc3{
    if (!_vc3) {
        _vc3 = [[ViewController3 alloc]init];
        __weak typeof(self) weakSelf = self;
        _vc3.DidScrollBlock = ^(CGFloat scrollY) {
            [weakSelf johnScrollViewDidScroll:scrollY];
        };
    }
    return _vc3;
}




@end
