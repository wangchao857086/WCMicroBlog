//
//  DiscoverViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "DiscoverViewController.h"
#import "WCSearchBar.h"
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
@interface DiscoverViewController ()<UISearchBarDelegate,UITextFieldDelegate,HMPopMenuDelegate>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) AFHTTPRequestOperationManager * manager;
@property (nonatomic,strong) AFHTTPRequestOperationManager * codeManager;
@property (nonatomic,assign) int page;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customSearchBar];
    self.page = 0;
    //设置导航栏按钮
//    [self setNavigationItem];
    //设置首页标题按钮
//    [self setHomeTitleButton];
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
    self.page ++;
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"access_token"] = [MBAccountManager getAccount].access_token
    ;
    NSString * url = [NSString stringWithFormat:@"%@?access_token=%@",@"https://api.weibo.com/2/emotions.json",[MBAccountManager getAccount].access_token];
    
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray * statusArr = [[NSMutableArray alloc]init];
        statusArr = [responseObject objectForKey:@"statuses"];
        //1.字典数组转模型数组
        NSArray * modelArray = [StatusModel mj_objectArrayWithKeyValuesArray:statusArr];
        [self.dataSource addObjectsFromArray:modelArray];
        //2.字典转模型
        //        for (NSDictionary * statusDic in statusArr) {
        //            StatusModel * model = [StatusModel mj_objectWithKeyValues:statusDic];
        //            [self.dataSource addObject:model];
        //        }
        //        self.dataSource = statusArr;
        //        NSLog(@"%@",self.dataSource);
        [self.tableView reloadData];
        //停止刷新
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
- (void)loadData
{
    self.tabBarItem.badgeValue = @"new";
     [UIApplication sharedApplication].applicationIconBadgeNumber = 5;
    //    MBProgressHUD * progress = [[MBProgressHUD alloc]init];
    //    [progress show:YES];
    //    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
    //获取用户信息
    
    //    NSString * doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //    NSString * filePath = [doc stringByAppendingPathComponent:@"account.plist"];
    //    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    //    NSString * access_token = dic[@"access_token"];
    //
    self.dataSource = nil;
    
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"access_token"] = [MBAccountManager getAccount].access_token
    ;
    NSString * url = [NSString stringWithFormat:@"%@?access_token=%@",kMicroBlogPublicDataUrl,[MBAccountManager getAccount].access_token
                      ];
    
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray * statusArr = [[NSMutableArray alloc]init];
        statusArr = [responseObject objectForKey:@"statuses"];
        //1.字典数组转模型数组
        NSArray * modelArray = [StatusModel mj_objectArrayWithKeyValuesArray:statusArr];
        [self.dataSource addObjectsFromArray:modelArray];
        //2.字典转模型
        //        for (NSDictionary * statusDic in statusArr) {
        //            StatusModel * model = [StatusModel mj_objectWithKeyValues:statusDic];
        //            [self.dataSource addObject:model];
        //        }
        //        self.dataSource = statusArr;
        //        NSLog(@"%@",self.dataSource);
        [self.tableView reloadData];
        //停止刷新
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - TableView data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"aCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aCell"];
    }
    StatusModel * status = self.dataSource[indexPath.row];
    cell.textLabel.text = status.text;
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
#pragma mark searchBar
- (void)customSearchBar
{
    WCSearchBar * searchBar = [[WCSearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 30)];
    searchBar.delegate = self;
       self.navigationItem.titleView = searchBar;
}
- (void)systemSearchBar
{
    // Do any additional setup after loading the view.
    UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 300, 35)];
    searchBar.backgroundImage = [UIImage resizeWithImageName:@"searchbar_background"];
    searchBar.searchBarStyle = UISearchBarIconClear;
    searchBar.placeholder = @"请输入查询条件";
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;

}
#pragma mark UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    WangChaoLog(@"textDidChange:搜索内容改变");
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    WangChaoLog(@"ShouldBeginEditing:开始编辑搜索内容");
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    WangChaoLog(@"CancelButtonClicked:取消搜索");
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    WangChaoLog(@"TextDidBeginEditing:开始编辑搜索内容");
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    WangChaoLog(@"SearchButtonClicked:开始搜索");
}
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WangChaoLog(@"FieldShouldBeginEditing:开始搜索");

    return YES;
}       // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    WangChaoLog(@"textFieldDidBeginEditing: became first responder");
}// became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    WangChaoLog(@"ChangeCharactersInRange:change text");
    return NO;
}// return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    WangChaoLog(@"textFieldShouldClear:clear button pressed");
    return NO;
}// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    WangChaoLog(@"textFieldShouldReturn:'return' key pressed");
    return NO;
}// called when 'return' key pressed. return NO to ignore.
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
