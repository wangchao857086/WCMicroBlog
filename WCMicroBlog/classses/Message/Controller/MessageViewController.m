//
//  MessageViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MessageViewController.h"
#import "ConposeMessageViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
       //设置导航栏
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:self action:@selector(composeLetter)];
    
    }
- (void)composeLetter
{
    WangChaoLog(@"composeLetter");
//    self.navigationItem.rightBarButtonItem.enabled = NO;
    ConposeMessageViewController * new = [[ConposeMessageViewController alloc]init];
    [self.navigationController pushViewController:new animated:YES];
    
    
}
#pragma mark - TableView data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"aCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据%ld",(long)indexPath.row]  ;
    return cell;
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
