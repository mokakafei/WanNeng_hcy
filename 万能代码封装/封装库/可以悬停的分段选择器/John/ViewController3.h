//
//  ViewController3.h
//  Linkage
//
//  Created by administrator on 2017/9/1.
//  Copyright © 2017年 JohnLai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3 : UIViewController

@property (nonatomic,copy) void(^DidScrollBlock)(CGFloat scrollY);

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
