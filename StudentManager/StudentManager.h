//
//  StudentManager.h
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//


//当前类主要提供 对学生表的操作 查看 更新
//还要提供数据库与表格的创建 需要将当前类写成一个单例类 目的保证每一次读到的都是同一份数据
#import <Foundation/Foundation.h>
#import "StudentModel.h"
@interface StudentManager : NSObject

//单例方法
+ (instancetype)sharedStudentManager;

//插入一个学生信息 (模型)
- (BOOL)insertStudent:(StudentModel *)stu;

//获取所有学生的信息
- (NSArray *)getAllStudentsData;

//更改学生信息
- (BOOL)updateStudent:(StudentModel *)stu;

//删除quanbu
- (BOOL)deleteAll;

//删除学生
- (BOOL)deleteStudentByID:(NSString *)ID;

- (void)createDatabaseAndTable;

//通过ID查询某个学生是否已经存在
- (BOOL)studentIsExistByID:(NSString *)ID;
@end
