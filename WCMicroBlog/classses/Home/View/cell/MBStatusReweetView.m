//
//  MBStatusReweetView.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBStatusReweetView.h"
@interface MBStatusReweetView()
@property (nonatomic,weak) UILabel * nameLabel;
@property (nonatomic,weak) UILabel * textLabel;
@end
@implementation MBStatusReweetView

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
        //昵称
        UILabel * nameLabel  = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //正文
        UILabel * textLabel = [[UILabel alloc]init];
        [self addSubview:textLabel];
        self.textLabel = textLabel;

    }
    return self;
}
@end
