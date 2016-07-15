//
//  MBAccount.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/21.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBAccount.h"

@implementation MBAccount
+ (instancetype)accountWithDictionary:(NSDictionary *)dic
{
    MBAccount * account = [[self alloc]init];
    account.access_token = dic[@"access_token"];
    account.expires_in = dic[@"expires_in"];
    account.uid = dic[@"uid"];
    //确定账号的过期时间
    NSDate * now = [NSDate date];
    account.expires_time = [now dateByAddingTimeInterval:[account.expires_in doubleValue]];
    
    return account;
}
/**
 *  当从文件中读取一个对象的时候调用
 *  在这个方法中写清楚怎么解析文件中的数据
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.expires_time = [aDecoder decodeObjectForKey:@"expires_time"];
           }
    return self;
}
/**
 *  当对象写入文件的时候调用
 *  在这方法中写入要存储哪些属性以及怎样存储属性
 *  @param aCoder <#aCoder description#>
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expires_time forKey:@"expires_time"];
}

@end
