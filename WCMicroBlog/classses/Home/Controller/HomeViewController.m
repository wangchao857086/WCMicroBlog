//
//  HomeViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "HomeViewController.h"

#import "WCTitleButton.h"
#import "HMPopMenu.h"
#import "MBAccountManager.h"
#import "UserModel.h"
#import "StatusModel.h"
#import "MJExtension.h"
#define APPKEY @"9294381"
#define APPSECRET @"072f47fffe278b2eeff1a36c0321cf9f"
#define REDIRECT_URL @"http://articletest.duapp.com/1/index.html"
#define URLSTRING @"https://api.weibo.com/oauth2/authorize"
#define URL_Oauth @"https://api.weibo.com/oauth2/access_token"
#define CODE @"08291bfc36ded0b3f61ef13fddc19ee2"
@interface HomeViewController ()<HMPopMenuDelegate>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) AFHTTPRequestOperationManager * manager;
@property (nonatomic,strong) AFHTTPRequestOperationManager * codeManager;
@property (nonatomic,assign) int page;
@end

@implementation HomeViewController
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    self.page = 0;
    [super viewDidLoad];
    //设置导航栏按钮
    [self setNavigationItem];
   //设置首页标题按钮
    [self setHomeTitleButton];
    //设置刷新空间
    [self setRefreshControl];
    [self loadData];
    [self.tableView reloadData];
//    [MBProgressHUD hideHUDForView:self.tableView animated:YES];
}
- (void)setNavigationItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendattention_dot@3x" WithHighlightImageName:@"navigationbar_friendattention_dot_highlighted" target:self WithMethod:@selector(friendSearch)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" WithHighlightImageName:@"navigationbar_pop_highlighted" target:self WithMethod:@selector(pop)];
}
- (void)setHomeTitleButton
{
    //文字相关
    WCTitleButton * button = [[WCTitleButton alloc]init];
    [button setTitle:@"首页" forState:UIControlStateNormal];
    //设置图片
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //    [button setBackgroundImage:[UIImage imageNamed:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    button.height = 30;
    button.width = 100;
    [button addTarget:self action:@selector(popView:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1;
    self.navigationItem.titleView = button;

}
- (void)popView:(UIButton *)titleButton
{
    if (titleButton.tag == 1) {
        titleButton.tag = 0;
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }
    else{
        titleButton.tag = 1;
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
//        WangChaoLog(@"下");
    
    }
//    WangChaoLog(@"popView~~~");
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];//设置箭头向上
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [button setBackgroundColor:[UIColor redColor]];
    HMPopMenu * menu = [[HMPopMenu alloc]initWithContentView:button];
    menu.delegate = self;
    menu.dimBackground = YES;
    [menu showInRect:CGRectMake(100, 100, 100, 100)];
    
    
}
- (void)pop
{
    WangChaoLog(@"pop~~~");
}
- (void)friendSearch
{
    WangChaoLog(@"friendSearch~~~");
}
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
- (AFHTTPRequestOperationManager *)manager
{
    if (_manager == nil) {
        _manager = [AFHTTPRequestOperationManager manager];

    }
    return _manager;
}
- (void)setRefreshControl
{
    //添加下拉刷新控件
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    //添加上拉加载控件
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
}
- (void)loadMoreData
{
//    self.page ++;
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"access_token"] = [MBAccountManager getAccount].access_token
    ;
    StatusModel * model = [self.dataSource lastObject];
    
    NSString * url = [NSString stringWithFormat:@"%@?access_token=%@&max_id=%lld",kMicroBlogHomeDataUrl,[MBAccountManager getAccount].access_token,[model.idstr longLongValue] - 1];
    
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray * statusArr = [[NSMutableArray alloc]init];
        statusArr = [responseObject objectForKey:@"statuses"];
        //1.字典数组转模型数组
        NSArray * modelArray = [StatusModel mj_objectArrayWithKeyValuesArray:statusArr];
        [self.dataSource addObjectsFromArray:modelArray];
        [self.tableView reloadData];
        //停止刷新
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //停止刷新
        [self.tableView.mj_footer endRefreshing];
    }];

}
/**
 *  加载最新的微博数据
 */
- (void)loadData
{
    self.tabBarItem.badgeValue = @"new";
    [UIApplication sharedApplication].applicationIconBadgeNumber = 5;
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"access_token"] = [MBAccountManager getAccount].access_token
;
    StatusModel * model = [self.dataSource firstObject];
    params[@"since_id"] = model.idstr;
    
    NSString * url = [NSString stringWithFormat:@"%@?access_token=%@&since_id=%@",kMicroBlogHomeDataUrl,[MBAccountManager getAccount].access_token,model.idstr
];
    
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray * statusArr = [[NSMutableArray alloc]init];
        statusArr = [responseObject objectForKey:@"statuses"];
        //1.字典数组转模型数组
        NSArray * modelArray = [StatusModel mj_objectArrayWithKeyValuesArray:statusArr];
        //创建临时数组 接入新数据并复制给数据源
        NSMutableArray * tempArray = [[NSMutableArray alloc]init];
        [tempArray addObjectsFromArray:modelArray];
        [tempArray addObjectsFromArray:self.dataSource];
        self.dataSource = tempArray;
        //刷新数据
        [self.tableView reloadData];
        //停止刷新
        [self.tableView.mj_header endRefreshing];
        //提示最新的微博数量
        [self showNewStatusNumbers:modelArray.count];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //停止刷新
        [self.tableView.mj_header endRefreshing];    }];
}
/**
 *  提示最新的微博数量
 *
 *  @param count 数目
 */
- (void)showNewStatusNumbers:(NSInteger) count
{
//    NSLog(@"%ld",(long)count);
    UILabel * label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    // 添加label到navigationBar的下面
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    if (count != 0) {
        label.text = [NSString stringWithFormat:@"更新了%ld条新的微博数据",count];
    }
    else{
        label.text = @"没有新的微博数据";
    }
    //计算label的位置
    label.width = kScreen_Width;
    label.height = 35;
    label.x = 0;
    label.y = 64 - label.height;
    label.alpha = 0.0;
    [UIView animateWithDuration:1.0f animations:^{
//        label.y = 64;
        label.transform = CGAffineTransformMakeTranslation(0, label.height);
        label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f delay:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
//            label.y = 64-label.height;
            label.transform = CGAffineTransformIdentity;
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];//内存中移除
        }];
        
    }];
    
}
#pragma mark - TableView data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  自定义cell
        提供两个模型，数据模型和frame模型
        将frame模型传递给cell，cell加一个frame属性
     */
    static NSString * ID = @"aCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"aCell"];
    }
    StatusModel * status = self.dataSource[indexPath.row];
    cell.textLabel.text = status.text;
    cell.detailTextLabel.text = status.user.name;
    NSURL * url = [NSURL URLWithString:[status.user avatar_h]];
    if (url == nil) {
        url = [NSURL URLWithString:status.user.avatar_large];
    }
    NSData * data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   
    UIViewController * new = [[UIViewController alloc]init];
    new.title = @"新控制器";
    //new.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:new animated:YES];
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
