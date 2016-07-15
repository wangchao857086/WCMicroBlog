//
//  MBStatusFrameModel.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBStatusDetailFrame.h"
@class StatusModel,MBStatusDetailFrame;
@interface MBStatusFrameModel : NSObject
@property (nonatomic,strong) MBStatusDetailFrame * detailFrame;
@property (nonatomic,assign) CGRect  toolBarFrame;
@property (nonatomic,strong) StatusModel * status;
@end
