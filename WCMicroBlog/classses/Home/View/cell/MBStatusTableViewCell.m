//
//  MBStatusTableViewCell.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBStatusTableViewCell.h"
#import "MBStatusToolBar.h"
#import "MBStatusDetailView.h"
@interface MBStatusTableViewCell()
@property (nonatomic,weak) MBStatusToolBar * toolBar;
@property (nonatomic,weak) MBStatusDetailView * detailView;
@end
@implementation MBStatusTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化子空间,contentView上  创建一个控件是不占内存的
        [self setUpDetailView];
        [self setUpToolBar];
        
    }
    return self;
}
- (void)setUpDetailView
{
    MBStatusDetailView * view = [[MBStatusDetailView alloc]init];
    self.detailView = view;
    [self.contentView addSubview:view];
}
- (void)setUpToolBar
{
    MBStatusToolBar * view = [[MBStatusToolBar alloc]init];
    self.toolBar = view;
    [self.contentView addSubview:view];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
