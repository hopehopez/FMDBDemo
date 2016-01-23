//
//  StudentCell.h
//  StudentManager
//
//  Created by Elean on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"
@interface StudentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

- (void)setUpCellWithModel:(StudentModel *)model;
//传递一个学生模型 将cell数据刷新

@end
