//
//  StudentCell.m
//  StudentManager
//
//  Created by Elean on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "StudentCell.h"

@implementation StudentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpCellWithModel:(StudentModel *)model{
    _nameLabel.text = [NSString stringWithFormat:@"姓名: %@", model.name];
    _IDLabel.text = [NSString stringWithFormat:@"学号: %@", model.ID];
    _ageLabel.text = [NSString stringWithFormat:@"年龄: %@", model.age];
}

@end
