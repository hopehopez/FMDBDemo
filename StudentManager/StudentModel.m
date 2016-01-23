//
//  StudentModel.m
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

+ (StudentModel *)createStudentWithDict:(NSDictionary *)dict{
    StudentModel *stu = [[StudentModel alloc] init];
    
    [stu setValuesForKeysWithDictionary:dict];
    //调用kvc给对象的属性赋值
    
    return stu;
}

@end
