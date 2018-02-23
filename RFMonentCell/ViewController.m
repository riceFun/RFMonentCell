//
//  ViewController.m
//  RFMonentCell
//
//  Created by 鲍帆 on 2017/1/18.
//  Copyright © 2017年 riceFun. All rights reserved.
//

#import "ViewController.h"
#import "MomentViewModel.h"
#import "Moments.h"
#import "MomentsTableViewCell.h"
#import "MJRefresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableVeiw;

@property (nonatomic,strong) NSMutableArray *moments; //数据模型
@property (nonatomic,strong) NSMutableArray *momentFrames;//ViewModel(包含cell子控件的Frame)

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setData];

}

- (void)setUI{
    self.title = @"RFMoments";
    //translucent navigationbar半透明 默认是透明的YES
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    //导航条颜色
    self.navigationController.navigationBar.barTintColor = iCodeNavigationBarColor;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableVeiw];
    
}


- (void)setData{
    
}

- (NSMutableArray *)moments{
    if (!_moments) {
        _moments = [NSMutableArray array];
        _moments = [Moments moments];
    }
    return _moments;
}


- (NSMutableArray *)momentFrames{
    if (!_momentFrames) {
        _momentFrames = [NSMutableArray array];
        //数据模型 => ViewModel(包含cell子控件的frame)
        for (Moments *monent in self.moments) {
            MomentViewModel *momentFrame = [[MomentViewModel alloc]init];
            momentFrame.moment = monent;
            [self.momentFrames addObject:momentFrame];
        }
    }
    return _momentFrames;
}

- (UITableView *)tableVeiw{
    if (!_tableVeiw) {
        CGFloat tableViewH = self.view.bounds.size.height - 49;
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, tableViewH) style:UITableViewStylePlain];
        _tableVeiw = tableView;
        //防止tableView被tabBar遮挡
        _tableVeiw.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(self.tabBarController.tabBar.frame), 0.0f);
        _tableVeiw.dataSource = self;
        _tableVeiw.delegate = self;
        _tableVeiw.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableVeiw.backgroundColor = [UIColor grayColor];
        _tableVeiw.backgroundColor = iCodeTableviewBgColor;
        //下拉刷新
        _tableVeiw.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        [_tableVeiw.mj_header beginRefreshing];
    }
    return _tableVeiw;
}

#pragma  mark - 加载最新数据
- (void)loadNewData{
    //模拟数据
    for (Moments *moment in self.moments) {
        MomentViewModel *momentFrames = [[MomentViewModel alloc]init];
        momentFrames.moment = moment;
        [_momentFrames addObject:momentFrames];
    }
    [self.tableVeiw reloadData];
    [self.tableVeiw.mj_header endRefreshing];
}

#pragma mark UItableViewDatasource & UItableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.momentFrames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MomentsTableViewCell *cell = [MomentsTableViewCell momentsTableViewCellWithTableView:tableView];
    cell.momentFrames = self.momentFrames[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取数据
    MomentViewModel *momentFrame = self.momentFrames[indexPath.section];
    return momentFrame.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return circleCellMargin;
}

//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footeView = [[UIView alloc]init];
    footeView.backgroundColor = [UIColor clearColor];
    return footeView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
