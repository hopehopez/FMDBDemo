//
//  AlertShowToolClass.h
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AlertShowToolClass : NSObject

+ (void)showAlertWithController:(UIViewController *)ctrView andMessage:(NSString *)message;
//方法可以让控制器 弹出一个提示框提示的 信息是message


@end
