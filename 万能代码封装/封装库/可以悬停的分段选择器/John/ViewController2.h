//
//  ViewController2.h
//  Linkage
//
//  Created by administrator on 2017/9/1.
//  Copyright © 2017年 JohnLai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

@property (nonatomic,copy) void(^DidScrollBlock)(CGFloat scrollY);

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
