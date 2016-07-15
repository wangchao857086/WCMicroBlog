//
//  CommonDateTool.m
//  WCMicroBlog
//
//  Created by 王超 on 16/7/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "CommonDateTool.h"

@implementation CommonDateTool

- (NSString *)transTimeFormat:(NSString *)timeStr
{
    NSDate * date = [self dateFromString:timeStr];
    
    NSString * timeString = [self stringFromDate:date];
    return timeString;
}
/**
 *  根据日期字符串返回特定格式的日期
 *
 *  @param dateString 日期字符串
 *
 *  @return 日期类型
 */
- (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
    
}
/**
 *  根据日期返回特定格式的字符串
 *
 *  @param date 传入的日期
 *
 *  @return 返回的字符串
 */
- (NSString *)stringFromDate:(NSDate *)date{
    
    NSString * weekString = [self weekdayStringFromDate:date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd %@ HH:mm",weekString]];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}
/**
 *  根据日期确定星期几
 *
 *  @param inputDate 传入的日期
 *
 *  @return 返回星期几
 */
- (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

@end
