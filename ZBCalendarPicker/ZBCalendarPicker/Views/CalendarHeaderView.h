//
//  CalendarHeaderView.h
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalendarHeaderView;

@protocol CalendarHeaderViewDelegate <NSObject>
-(void)calendarHeaderView:(CalendarHeaderView *)calendarHeaderView previousBtnAction:(UIButton *)sender;
-(void)calendarHeaderView:(CalendarHeaderView *)calendarHeaderView nextBtnAction:(UIButton *)sender;
@end
@interface CalendarHeaderView : UIView
@property (nonatomic,strong) id<CalendarHeaderViewDelegate> headerViewDelegate;
@end
