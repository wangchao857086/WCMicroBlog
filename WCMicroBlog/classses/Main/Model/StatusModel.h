//
//  StatusModel.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/22.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface StatusModel : NSObject

//
//@property (nonatomic,assign) int attitudes_count;//0,
//@property (nonatomic,assign) int biz_feature;//0,
//@property (nonatomic,strong) NSArray *biz_ids;
@property (nonatomic,assign) int comments_count;;//0,
@property (nonatomic,copy) NSString *created_at;//"Wed Jun 22 00:09:48 +0800 2016",
//@property (nonatomic,strong) NSArray *darwin_tags;//[],
//@property (nonatomic,assign) BOOL *favorited;//false,
//@property (nonatomic,copy) NSString *geo;//null,
//@property (nonatomic,strong) NSArray *hot_weibo_tags;//[],
//@property (nonatomic,assign) int *id;//3988958952672583,
@property (nonatomic,copy) NSString *idstr;//"3988958952672583",
//@property (nonatomic,copy) NSString *in_reply_to_screen_name;//"",
//@property (nonatomic,copy) NSString *in_reply_to_status_id;//"",
//@property (nonatomic,copy) NSString *in_reply_to_user_id;//"",
//@property (nonatomic,assign) BOOL *isLongText;//false,
@property (nonatomic,copy) NSString *mid;//"3988958952672583",
//@property (nonatomic,assign) int mlevel;//0,
//@property (nonatomic,assign) int page_type;//33,
@property (nonatomic,strong) NSArray *pic_urls;//[],
//@property (nonatomic,assign) int positive_recom_flag;//0,
@property (nonatomic,assign) int reposts_count;//0,
@property (nonatomic,copy) NSString *source;//"<a href=\"http:;//app.weibo.com/t/feed/5yiHuw\" rel=\"nofollow\">iPhone 6 Plus</a>",
//@property (nonatomic,assign) int source_allowclick;//0,
//@property (nonatomic,assign) int source_type;//1,
@property (nonatomic,copy) NSString *text;//"@冯建宇DTX 不要怕，我们帮你把冠军拿！同志们冲向#亚洲新歌榜#为 http:;//t.cn/R5Cvvct 加油呀！",
//@property (nonatomic,copy) NSString *textLength;//90,
//@property (nonatomic,strong) NSArray *text_tag_tips;//[],
//@property (nonatomic,assign) BOOL *truncated;//false,
@property (nonatomic,strong) UserModel *user;//{
@property (nonatomic,assign) int userType;//0,
//@property (nonatomic,assign) int visible;

@end
