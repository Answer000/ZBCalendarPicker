//
//  CalendarConst.h
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

//屏幕尺寸
#define KWidth   [UIScreen mainScreen].bounds.size.width
#define KHeight  [UIScreen mainScreen].bounds.size.height

//左右边距
UIKIT_EXTERN CGFloat const calendarEdgeSpacing;
//行间距
UIKIT_EXTERN CGFloat const calendarRowSpacing;
//列间距
UIKIT_EXTERN CGFloat const calendarColSpacing;
//每行最多item数量
UIKIT_EXTERN NSInteger const calendarMaxRowCount;

//用来调节Item的Label的上下位置
#define KItemDateEdgeInsets     UIEdgeInsetsMake(-10, 0, 0, 0)
//用来调节Item的textfield的上下位置
#define KItemMessageEdgeInsets  UIEdgeInsetsMake(0, 0, 0, 0)

//主体色
#define KMainColor          [UIColor colorWithRed:0.082 green:0.800 blue:0.612 alpha:1.000]
//过去的日期的字体颜色
#define KPastDateColor      [UIColor colorWithWhite:0.435 alpha:1.000]
//今天的日期的字体颜色
#define KCurrentDateColor   [UIColor colorWithRed:0.282 green:0.596 blue:0.922 alpha:1.000]
//将来的日期的字体颜色
#define KFutureDateColor    [UIColor colorWithWhite:0.796 alpha:1.000]

//calendarHeaderView的背景色
#define KCalendarHeaderViewBackgroundColor  [UIColor colorWithRed:0.082 green:0.800 blue:0.612 alpha:1.000]
//calendarHeaderView上的字体颜色
#define KCalendarHeaderViewTextColor   [UIColor whiteColor]

//calendarHeaderView上按钮的边距
UIKIT_EXTERN CGFloat const  calendarHeaderViewItemEdgeSpacing;
//calendarHeaderView的高度
UIKIT_EXTERN CGFloat const  calendarHeaderViewHeight;

UIKIT_EXTERN NSString *const CalendarChangeHeaderTitleNotification;



