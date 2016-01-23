//
//  DeleteViewController.m
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "DeleteViewController.h"
#import "AlertShowToolClass.h"
#import "StudentManager.h"
@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"删除学生信息";
    
    
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

- (IBAction)deleteClick:(id)sender {
    NSString *ID = _IDField.text;
    NSString *message = nil;
    if (ID == 0){
        message = @"删除条件不能为空";
        [AlertShowToolClass showAlertWithController:self andMessage:message];
        return;
    }
    
    StudentManager *manager = [StudentManager sharedStudentManager];
    
    if ([ID isEqualToString:@"all"]) {
        BOOL isOK = [manager deleteAll];
        if (isOK) {
            message = @"清空数据成功";
            _IDField.text = nil;
        }else {
            message = @"清空数据失败";
        }
    }else {
        BOOL isOK = [manager deleteStudentByID:ID];
        if (isOK) {
            message = @"删除数据成功";
            _IDField.text = nil;
        }else {
            message = @"删除数据失败";
        }

    }
    [AlertShowToolClass showAlertWithController:self andMessage:message];
    
}
@end
