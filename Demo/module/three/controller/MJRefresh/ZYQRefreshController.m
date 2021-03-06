//
//  ZYQRefreshController.m
//  Demo
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2018/9/25.
//  Copyright © 2018年 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "ZYQRefreshController.h"
#import "ZYQRefreshModel.h"

@interface ZYQRefreshController ()<UITableViewDelegate , UITableViewDataSource>
/**数据源 */
@property (nonatomic , strong)NSArray *nextVCData;
/**tableView */
@property (nonatomic , strong)UITableView *tableView;

@end

@implementation ZYQRefreshController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"MJRefresh";
    [self createUI];
    [self loadData];
}


#pragma mark - 设置UI
- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - ZYQ_TopH) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}
#pragma mark - 加载数据
- (void)loadData {
    self.nextVCData = [ZYQRefreshModel loadData];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.nextVCData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZYQRefreshModel *model = self.nextVCData[section];
    return model.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    UIView *backgroundViews = [[UIView alloc]initWithFrame:cell.frame];
    backgroundViews.backgroundColor = [UIColor ZYQ_randomColor];
    [cell setSelectedBackgroundView:backgroundViews];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    ZYQRefreshModel *model = self.nextVCData[indexPath.section];
    cell.backgroundColor = kNavColor;
    cell.textLabel.text = model.titles[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", model.vcClass, model.methods[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYQRefreshModel *model = self.nextVCData[indexPath.section];
    UIViewController *vc = [[model.vcClass alloc] init];
    vc.title = model.titles[indexPath.row];
    [vc setValue:model.methods[indexPath.row] forKeyPath:@"method"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ZYQRefreshModel *model = self.nextVCData[section];
    return model.header;
}


@end
