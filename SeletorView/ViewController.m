//
//  ViewController.m
//  SeletorView
//
//  Created by 周彦彤 on 16/1/4.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "ViewController.h"
#import "SelectorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(220, 120, 40, 40);
    [btn addTarget:self action:@selector(showSelectView) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
}

- (void)showSelectView {
    [[SelectorView selectViewInstance] popSelectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
