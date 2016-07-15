//
//  ConposeMessageViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/20.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "ConposeMessageViewController.h"

@interface ConposeMessageViewController ()

@end

@implementation ConposeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, 200, 44)];
    UIToolbar * toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStyleDone target:nil action:nil];
    [toolBar setItems:@[item]];
    textField.inputAccessoryView = toolBar;
    [self.view addSubview:textField];
    
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
