//
//  ShowViewController.m
//  StudentManager
//
//  Created by 张树青 on 16/1/11.
//  Copyright (c) 2016年 Elean. All rights reserved.
//

#import "ShowViewController.h"
#import "StudentCell.h"
//因为cell的头文件中 已经包含模型头文件
#import "StudentManager.h"
#import "AlertShowToolClass.h"

@interface ShowViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ShowViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"展示学生信息";
    
    //创建tableView
    [self createTableView];
    
}

#pragma mark - create TableView
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.rowHeight = 80;
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"StudentCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    
    [self.view addSubview:_tableView];
}

#pragma mark - 获取数据
- (void)reloadData{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }else {
        [_dataArr removeAllObjects];
    }
    //读取表格中的所有数据
    StudentManager *manager = [StudentManager sharedStudentManager];
    
    NSArray *array = [manager getAllStudentsData];
    [_dataArr addObjectsFromArray:array];
    
    //tableView 刷新数据
    [self.tableView reloadData];
}

#pragma mark - data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[StudentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell setUpCellWithModel:_dataArr[indexPath.row]];
    //dataArr中存放的是model
    return cell;
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



@end
