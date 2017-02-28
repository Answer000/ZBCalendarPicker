//
//  CalendarModel.h
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarModel : NSObject
@property (nonatomic,copy) UIColor *textColor;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *message;
@property (nonatomic,copy) UIColor *backgroundColor;
@property (nonatomic,assign) BOOL isPermissEdit;

-(instancetype)initWithDate:(NSDate *)date index:(NSInteger)index today:(NSDate *)today;
@end
