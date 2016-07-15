//
//  UserModel.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/22.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserModel :NSObject


//@property (nonatomic,assign) BOOL *allow_all_act_msg;//false,
//@property (nonatomic,assign) BOOL *allow_all_comment;//true,
@property (nonatomic,copy) NSString *avatar_h; //"http://tva4.sinaimg.cn/crop.0.0.639.639.1024/7a46022bjw8ev9fgkcu1tj20hs0hr3zf.jpg",
@property (nonatomic,copy) NSString *avatar_large;//"http://tva4.sinaimg.cn/crop.0.0.639.639.180/7a46022bjw8ev9fgkcu1tj20hs0hr3zf.jpg",
@property (nonatomic,assign) int bi_followers_count;//294,
//@property (nonatomic,assign) int block_app;//0,
//@property (nonatomic,assign) int block_word;//0,
//@property (nonatomic,copy) NSString *cardid;//"star_026",
@property (nonatomic,copy) NSString *city;//"2",
//@property (nonatomic,assign) int classStr;//1,
@property (nonatomic,copy) NSString *cover_image;//"http://ww3.sinaimg.cn/crop.0.0.920.300/7a46022bgw1erzohrrid5j20pk08cwge.jpg",
@property (nonatomic,copy) NSString *cover_image_phone;//"http://ww4.sinaimg.cn/crop.0.0.640.640.640/6ce2240djw1e8iktk4ohij20hs0hsmz6.jpg",
@property (nonatomic,copy) NSString *created_at;//"Mon Mar 28 23:39:37 +0800 2011",
@property (nonatomic,assign) int credit_score;//80,
@property (nonatomic,copy) NSString *descriptionStr;//"扎大爷不在，刷小号去了。",
//@property (nonatomic,copy) NSString *domain;//"",
@property (nonatomic,assign) int favourites_count;//389,
//@property (nonatomic,assign) BOOL *follow_me;//false,
@property (nonatomic,assign) int followers_count;//830,
//@property (nonatomic,copy) NSString *following;//false,
@property (nonatomic,assign) int friends_count;//583,
@property (nonatomic,copy) NSString *gender;//"f",
//@property (nonatomic,copy) NSString *geo_enabled;//false,
//@property (nonatomic,copy) NSString *id;//2051408427,
@property (nonatomic,copy) NSString *idstr;//"2051408427",
@property (nonatomic,copy) NSString *lang;//"zh-cn",
@property (nonatomic,assign) int location;//"福建 厦门",
//@property (nonatomic,assign) int mbrank;//0,
//@property (nonatomic,copy) NSString *mbtype;//0,
@property (nonatomic,copy) NSString *name;//"扎大爷不是我是谁",
//@property (nonatomic,assign) int online_status;//0,
//@property (nonatomic,assign) int pagefriends_count;//0,
@property (nonatomic,copy) NSString *profile_image_url;//"http://tva4.sinaimg.cn/crop.0.0.639.639.50/7a46022bjw8ev9fgkcu1tj20hs0hr3zf.jpg",
@property (nonatomic,copy) NSString *profile_url;//"u/2051408427",
@property (nonatomic,copy) NSString *province;//"35",
//@property (nonatomic,copy) NSString *ptype;//0,
//@property (nonatomic,copy) NSString *remark;//"",
@property (nonatomic,copy) NSString *screen_name;//"扎大爷不是我是谁",
//@property (nonatomic,assign) int star;//0,
@property (nonatomic,assign) int statuses_count;//959,
//@property (nonatomic,assign) int urank;//29,
@property (nonatomic,copy) NSString *url;//"http://blog.sina.com.cn/u/2051408427",
//@property (nonatomic,assign) int user_ability;//0,
//@property (nonatomic,assign) BOOL *verified;//false,
//@property (nonatomic,copy) NSString *verified_reason;//"",
//@property (nonatomic,copy) NSString *verified_reason_url;//"",
//@property (nonatomic,copy) NSString *verified_source;//"",
//@property (nonatomic,copy) NSString *verified_source_url;//"",
//@property (nonatomic,copy) NSString *verified_trade;//"",
//@property (nonatomic,assign) int verified_type;//220,
//@property (nonatomic,copy) NSString *weihao;//""



@end
