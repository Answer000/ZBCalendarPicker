//
//  CalendarDateHelper.h
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarDateHelper : NSObject
+(NSInteger)totalDaysInMonth:(NSDate *)date;
+(NSInteger)firstWeekDayInThisMonth:(NSDate *)date;
+(NSInteger)day:(NSDate *)date;
+(NSInteger)month:(NSDate *)date;
+(NSInteger)year:(NSDate *)date;
+(NSDate*)nextMonth:(NSDate *)date;
+(NSDate *)lastMonth:(NSDate *)date;
@end
