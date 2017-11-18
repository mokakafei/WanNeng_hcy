//
//  ViewController1.h
//  Linkage
//
//  Created by administrator on 2017/9/1.
//  Copyright © 2017年 JohnLai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JohnScrollViewDelegate<NSObject>

@optional
- (void)johnScrollViewDidScroll:(CGFloat)scrollY;

@end

@interface ViewController1 : UIViewController

@property (nonatomic,copy) void(^DidScrollBlock)(CGFloat scrollY);

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,weak) id<JohnScrollViewDelegate>delegate;

@end
