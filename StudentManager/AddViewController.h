//
//  AddViewController.h
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *IDField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
- (IBAction)submitClick:(id)sender;

@end
