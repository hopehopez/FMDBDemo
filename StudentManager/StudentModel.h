//
//  StudentModel.h
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

//姓名 学号 年龄
#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) NSNumber *age;

+ (StudentModel *)createStudentWithDict:(NSDictionary *)dict;
//类工厂方法

@end
