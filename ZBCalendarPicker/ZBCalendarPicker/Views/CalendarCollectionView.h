//
//  CalendarCollectionView.h
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarHeaderView.h"

@interface CalendarCollectionView : UICollectionView
@property (nonatomic,strong) NSDate *today;
@property (nonatomic,strong) NSDate *date;
@end
