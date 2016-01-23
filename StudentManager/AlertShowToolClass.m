//
//  AlertShowToolClass.m
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "AlertShowToolClass.h"

@implementation AlertShowToolClass

+ (void)showAlertWithController:(UIViewController *)ctrView andMessage:(NSString *)message{
    
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [alertCtrl dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertCtrl addAction:action];
    
    [ctrView presentViewController:alertCtrl animated:YES completion:nil];
    //让传进来的控制器将当前设置好的alert弹出
    
    
}

@end
