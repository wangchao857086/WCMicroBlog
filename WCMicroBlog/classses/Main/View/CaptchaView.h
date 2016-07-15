//
//  CaptchaView.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/29.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^imageClick)();
@interface CaptchaView : UIView
@property (nonatomic,strong) UITextField * textField;
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,copy) NSString * CaptchaUrl;
@property (nonatomic,copy) void(^imageClick)();


@end
