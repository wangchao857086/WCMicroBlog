//
//  MBAccount.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/21.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBAccount : NSObject <NSCoding>
/*
 *  "access_token" = "2.006HZcfC004tzc54d9064054YpINCB";
    "expires_in" = 157679999;
    "remind_in" = 157679999;
    uid = 2447286903;
*/
/**
*  接口获取的access_token
*/
@property (nonatomic,copy) NSString * access_token;
/**
*  接口获取的access_token的生命周期
*/
@property (nonatomic,copy) NSString * expires_in;
/**
 *  用户的id
 */
@property (nonatomic,copy) NSString * uid;


@property (nonatomic,strong) NSDate * expires_time;
+ (instancetype)accountWithDictionary:(NSDictionary *)dic;
@end
