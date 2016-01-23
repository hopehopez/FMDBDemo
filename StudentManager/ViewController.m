//
//  ViewController.m
//  StudentManager
//
//  Created by Elean on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "ViewController.h"
#import "AlertShowToolClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *titles = @[@"添加学生", @"展示学生", @"删除学生"];
    for(int i = 0 ; i < 3; i++){
    
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 60 + 60*i, 275, 50)];
        btn.backgroundColor = [UIColor purpleColor];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    //[AlertShowToolClass showAlertWithController:self andMessage:@"测试"];
    
}

#pragma mark -- button点击事件

- (void)btnClick:(UIButton *)btn{
    
    NSArray *controllerName = @[@"AddViewController", @"ShowViewController", @"DeleteViewController"];
    
    Class cls = NSClassFromString(controllerName[btn.tag - 100]);
    
    UIViewController *ctr = [[cls alloc] init ];
    
    [self.navigationController pushViewController:ctr animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
