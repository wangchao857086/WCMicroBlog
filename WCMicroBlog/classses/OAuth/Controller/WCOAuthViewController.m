//
//  WCOAuthViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/27.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "WCOAuthViewController.h"
#import "MBProgressHUD.h"
#import "WCControllerTool.h"
#import "MBAccount.h"
#import "MBAccountManager.h"
@interface WCOAuthViewController () <UIWebViewDelegate>

@end

@implementation WCOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView * webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",kMicroBlogAPPKey,kMicroBlogRedirectUri]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.delegate = self;
}
//每发送一个请求都会调用的方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //即将发送的请求
    NSString * url = request.URL.absoluteString;
    NSRange range = [url rangeOfString:[NSString stringWithFormat:@"%@?code=",kMicroBlogRedirectUri]];
    if (range.location != NSNotFound) {
        //是回调地址
        NSLog(@"%@",url);
        int from = (int)range.location + (int)range.length;
      NSString * codeString = [url substringFromIndex:from];
        //NSLog(@"%@",codeString);
        //根据code获得一个access Token
        [self accessTokenWithCode:codeString];
        //禁止加载回调页面
        return NO;
    }
       
  
    return YES;
}
- (void)accessTokenWithCode:(NSString *)code
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    NSString * tokenURL = @"https://api.weibo.com/oauth2/access_token";
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"client_id"] = kMicroBlogAPPKey;
    params[@"client_secret"] = kMicroBlogAPPSecret;
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = kMicroBlogRedirectUri;
    
    
    [manager POST:tokenURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSLog(@"access——token    %@",responseObject);
        //字典转模型
        MBAccount * account = [MBAccount accountWithDictionary:responseObject];
        //存储授权成功的账号信息
        [MBAccountManager saveAccount:account];
        //选择控制器
        [WCControllerTool chooseRootViewController];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
