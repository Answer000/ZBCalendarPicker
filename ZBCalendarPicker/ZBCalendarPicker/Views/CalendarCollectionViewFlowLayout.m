//
//  CalendarCollectionViewFlowLayout.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "CalendarCollectionViewFlowLayout.h"
#import "CalendarConst.h"

@implementation CalendarCollectionViewFlowLayout

-(void)prepareLayout{
    CGFloat itemWidth = (KWidth - (2 * calendarEdgeSpacing) - (calendarMaxRowCount - 1) * calendarColSpacing) / calendarMaxRowCount;
    CGFloat itemHeight = itemWidth;
    self.itemSize = CGSizeMake(itemWidth, itemHeight);
    self.minimumLineSpacing = calendarRowSpacing;
    self.minimumInteritemSpacing = calendarColSpacing;
}

@end
