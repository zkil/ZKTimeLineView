//
//  ViewController.m
//  ZKTimeLineView
//
//  Created by pang on 2017/6/7.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ViewController.h"
#import "ZKTimeLineView.h"
#import <Masonry/Masonry.h>
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    ZKTimeLineView *lineView = [[ZKTimeLineView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.center.mas_equalTo(self.view);
    }];
    lineView.data = @[@"111",@"222",@"3333333333333",@"5555"];
    lineView.currentIndex = 2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
