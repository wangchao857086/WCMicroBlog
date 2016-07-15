//
//  MBStatusOriginalFrame.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StatusModel;
@interface MBStatusOriginalFrame : NSObject
@property (nonatomic,assign) CGRect   nameFrame;
@property (nonatomic,assign) CGRect   textFrame;
@property (nonatomic,assign) CGRect   timeFrame;
@property (nonatomic,assign) CGRect   sourceFrame;
@property (nonatomic,assign) CGRect   iconFrame;
@property (nonatomic,assign) UIImageView * imageView;
@property (nonatomic,strong) StatusModel * status;
@end
