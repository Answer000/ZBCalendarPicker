//
//  CalendarModel.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "CalendarModel.h"
#import "CalendarConst.h"
#import "CalendarDateHelper.h"

@implementation CalendarModel

-(instancetype)initWithDate:(NSDate *)date index:(NSInteger)index today:(NSDate *)today{
    if (self = [super init]) {
        if ([today isEqualToDate:date]) {
            if (index == [CalendarDateHelper day:date]) {
                self.textColor = KCurrentDateColor;
            }else if(index > [CalendarDateHelper day:date]){
                self.textColor = KFutureDateColor;
            }else{
                self.textColor = KPastDateColor;
            }
        }else if ([today compare:date] == NSOrderedAscending){
            self.textColor = KFutureDateColor;
        }else{
            self.textColor = KPastDateColor;
        }
    }
    return self;
}
@end
