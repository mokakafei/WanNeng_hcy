//
//  ViewController3.m
//  Linkage
//
//  Created by administrator on 2017/9/1.
//  Copyright © 2017年 JohnLai. All rights reserved.
//

#import "ViewController3.h"
#import "UIColor+Tools.h"

@interface ViewController3 ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    self.collectionView.backgroundColor = self.view.backgroundColor;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.collectionViewLayout = [self customLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
}

- (UICollectionViewLayout *)customLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width / 2, self.view.frame.size.width / 2);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    return layout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 255.0 green:arc4random()%255 / 255.0 blue:arc4random()%255 / 255.0 alpha:1];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.DidScrollBlock) {
        self.DidScrollBlock(scrollView.contentOffset.y);
    }
}

@end
