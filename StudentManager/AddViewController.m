//
//  AddViewController.m
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "AddViewController.h"
#import "StudentModel.h"
#import "StudentManager.h"
#import "AlertShowToolClass.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"插入学生信息";
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_nameField resignFirstResponder];
    [_IDField resignFirstResponder];
    [_ageField resignFirstResponder];
}

- (IBAction)submitClick:(id)sender {
    
    [_nameField resignFirstResponder];
    [_IDField resignFirstResponder];
    [_ageField resignFirstResponder];
    
    NSString *name = _nameField.text;
    NSString *ID = _IDField.text;
    NSString *age = _ageField.text;
    
    NSString *message = nil;
    if (name.length == 0 || ID.length == 0 || age.length == 0) {
        message = @"学生信息不能为空";
        [AlertShowToolClass showAlertWithController:self andMessage:message];
        
        return;
    }
    
    //1.封装模型
    NSDictionary *dic = @{@"name": name,
                          @"ID": ID,
                          @"age": age};
    
    StudentModel *model = [StudentModel createStudentWithDict:dic];
    
    
    //2.将数据写入数据库
    StudentManager *manager = [StudentManager sharedStudentManager];
    //如果学生的学号已经在数据库中存在 那么不是添加一个新的学生信息 而是更新
    
    //(1)先判断ID是够已经存在
    if ([manager studentIsExistByID:ID]){
        //执行更新
        BOOL isOK = [manager updateStudent:model];
        if (isOK) {
            message = @"更新成功";
            _nameField.text = nil;
            _IDField.text = nil;
            _ageField.text = nil;
        } else {
            message = @"更新失败";
        }
    } else{
        //执行插入
        BOOL isOK = [manager insertStudent:model];
        if (isOK) {
            message = @"插入成功";
            _nameField.text = nil;
            _IDField.text = nil;
            _ageField.text = nil;
        } else {
            message = @"插入失败";
        }
    }
    [AlertShowToolClass showAlertWithController:self andMessage:message];
    
}
@end
