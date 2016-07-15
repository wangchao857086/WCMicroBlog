//
//  ProfileViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "ProfileViewController.h"
#import "CaptchaView.h"
#define URL @"https://api.bushangban.com/v1/users/send_verify_code"
@interface ProfileViewController ()
@property (nonatomic,strong) AFHTTPRequestOperationManager * manager;
@end

@implementation ProfileViewController
{
    CaptchaView * captcha;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self loadData];
    
//    NSHTTPURLResponse
    
//    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://api.bushangban.com/simple_captcha?time=1467105950&code=4ae3ed0c746e87b1c58343ed17ad3810e5393b9f"] placeholderImage:nil];
//    [self.view addSubview:imageView];
}
- (void)loadData
{   [captcha removeFromSuperview];
    [self.manager POST:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        WangChaoLog(@"responseObject-------%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        WangChaoLog(@"error--------%@",[error.userInfo[@"AFNetworkingOperationFailingURLResponseErrorKey"] allHeaderFields]);
        NSDictionary * dic = [error.userInfo[@"AFNetworkingOperationFailingURLResponseErrorKey"] allHeaderFields];
        NSString * capUrl = dic[@"Captcha-Image-Url"];
        NSString * capKey = dic[@"Captcha-Key"];
       captcha = [[CaptchaView alloc]initWithFrame:CGRectMake(20, 20, 200, 30)];
        __weak ProfileViewController *  selfCap = self;
        captcha.imageClick = ^(){
            [selfCap loadData];
        };
        captcha.CaptchaUrl = capUrl;
        [self.view addSubview:captcha];
        
    }];

}
- (AFHTTPRequestOperationManager *)manager
{
    if (_manager == nil) {
        _manager = [[AFHTTPRequestOperationManager alloc]init];
    }
    return _manager;
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
