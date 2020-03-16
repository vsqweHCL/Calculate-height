//
//  MoreViewController.m
//  demo
//
//  Created by xuzhiyong on 2020/3/16.
//  Copyright © 2020 xxx. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *add = [[UIButton alloc] init];
    [add setTitle:@"添加" forState:0];
    add.frame = CGRectMake(100, 100, 100, 100);
    add.backgroundColor = [UIColor redColor];
    [add addTarget:self action:@selector(addAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:add];
}

- (void)addAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addData)]) {
        [self.delegate addData];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
