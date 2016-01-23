//
//  StudentManager.m
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "StudentManager.h"
#import "FMDB.h"

static StudentManager *sharedManager = nil;
@interface StudentManager ()
@property (nonatomic, strong) FMDatabase *database;
//数据库
@end

@implementation StudentManager

#pragma mark - 单例方法
+ (instancetype)sharedStudentManager{
    
    static dispatch_once_t onceToken;
    //标志位 0 如果下面的代码执行过 标志位变成1 下一次再进来就不会在执行以下代码 保证代码的运行只有一次
    dispatch_once(&onceToken,^{
        sharedManager = [[StudentManager alloc] init];
        //创建单例对象 的时候 也应该就爱那个数据库创建
        
        //sharedManager = [[self alloc] init];
        
    });
    
    [sharedManager createDatabaseAndTable];
    return sharedManager;
}
#pragma mark - 创建数据库与表格 (私有)
- (void)createDatabaseAndTable{
    //1.连接数据库路径
    NSString *path = [NSString stringWithFormat:@"%@/Documents/Student.db", NSHomeDirectory()];
    NSLog(@"%@", path);
    //2.创建数据库
    _database = [FMDatabase databaseWithPath:path];
    
    //3.创建数据库
    [_database open];
    
    //4.创建表格
    //(1)sql语句
    NSString *sql = @"create table if not exists Students (name text, ID text, age integer)";
    
    //(2)执行sql语句
    BOOL isOK = [_database executeUpdate:sql];
    if (isOK) {
        NSLog(@"创建成功");
    } else {
        NSLog(@"创建失败");
    }
}
#pragma mark - 插入一个学生信息 (模型)
- (BOOL)insertStudent:(StudentModel *)stu{
    NSString *sqlInsert = @"insert into Students values(?,?,?) ";
    
    BOOL isOK = [_database executeUpdate:sqlInsert, stu.name, stu.ID, stu.age];
    if (isOK) {
        NSLog(@"插入成功");
    } else {
        NSLog(@"插入失败");
    }
    
    return isOK;
}

#pragma mark - 获取所有学生的信息
- (NSArray *)getAllStudentsData{
    
    NSString *sqlSelect = @"select * from Students";
    
    FMResultSet *resultSet = [_database executeQuery:sqlSelect];
    
    NSMutableArray *studentsArr = [NSMutableArray array];
    //数组 存储封装好的模型对象 返回
    
    //通过while循环 把每一条信息取出 封装成模型
    
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumnIndex:0];
        NSString *ID = [resultSet stringForColumnIndex:1];
        NSString *ageStr = [resultSet stringForColumnIndex:2];
        NSNumber *age = @([ageStr integerValue]);
        
        //存入字典
        NSDictionary *dic = @{@"name": name,
                            @"ID": ID,
                            @"age": age};
        
        //封装成模型
        StudentModel *stu = [StudentModel createStudentWithDict:dic];
        
        [studentsArr addObject:stu];
    }
    
    return studentsArr;
}

#pragma mark - 更改学生信息
- (BOOL)updateStudent:(StudentModel *)stu{
    
    NSString *sqlUpdate = @"update Students set name = ?, age = ? where ID = ?";
    
    BOOL isOK = [_database executeUpdate:sqlUpdate, stu.name, stu.age, stu.ID];
    if (isOK) {
        NSLog(@"插入成功");
    } else {
        NSLog(@"插入失败");
    }

    return isOK;
}

#pragma mark - 删除quanbu
- (BOOL)deleteAll{
    
    
    NSString *sqlClear = @"delete from Students";
    
    return [_database executeUpdate:sqlClear];
    
}

#pragma mark - 删除学生
- (BOOL)deleteStudentByID:(NSString *)ID{
    
    NSString *sqlDelete = @"delete from Students where ID = ?";
    BOOL result = [_database executeUpdate:sqlDelete, ID];
    return result;
}

#pragma mark - 通过ID查询某个学生是否已经存在
- (BOOL)studentIsExistByID:(NSString *)ID{
    NSString *sqlSelect = @"select * from Students where ID = ?";
    
   FMResultSet *resultSet = [_database executeQuery:sqlSelect, ID];
    
    int count = 0;
    while ([resultSet next]) {
        count++;
    }
    //如果不存在 count = 0 no
    //如果存在 count++ yes
    return  count;
}
@end
