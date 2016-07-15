//
//  CaptchaView.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/29.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "CaptchaView.h"

@implementation CaptchaView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //初始化
        [self addUI];
    }
    return self;
}
- (void)addUI
{
    self.userInteractionEnabled = YES;
    self.textField = [[UITextField alloc]init];
    self.textField.frame = CGRectMake(0, 0, 100, 30);
    self.textField.placeholder = @"请输入验证码";
    [self addSubview:self.textField];
    self.imageView = [[UIImageView alloc]init];
    self.imageView.frame = CGRectMake(100, 0, 100, 30);
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClicked)];
    [self.imageView addGestureRecognizer:tap];
    [self addSubview:self.imageView];
    
}
- (void)imageClicked
{
    NSLog(@"imageTapped");
    if (self.imageClick) {
        _imageClick();
    }
}
- (void)setCaptchaUrl:(NSString *)CaptchaUrl
{
    _CaptchaUrl = CaptchaUrl;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_CaptchaUrl] placeholderImage:[UIImage imageNamed:@"empty_search@3x"]];
    
}
@end
