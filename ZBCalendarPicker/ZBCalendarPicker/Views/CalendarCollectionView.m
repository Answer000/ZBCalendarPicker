//
//  CalendarCollectionView.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "CalendarCollectionView.h"
#import "CalendarCollectionViewFlowLayout.h"
#import "CalendarCollectionViewCell.h"
#import "CalendarModel.h"
#import "CalendarConst.h"
#import "CalendarDateHelper.h"
#import "UIView+Frame.h"

@interface CalendarCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,copy) NSMutableArray<CalendarModel *> *weekDayArray;
@property (nonatomic,copy) NSMutableArray<CalendarModel *> *dateArray;
@property (nonatomic,copy) NSMutableArray<NSArray *> *datas;
@end
static NSString *const calendarCellIdent = @"calendarCell";
@implementation CalendarCollectionView
-(NSMutableArray<CalendarModel *> *)weekDayArray{
    if (!_weekDayArray) {
        _weekDayArray = [NSMutableArray array];
        NSArray *titles = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        for (NSString *title in titles) {
            CalendarModel *model = [[CalendarModel alloc] init];
            model.date = title;
            model.textColor = KMainColor;
            [_weekDayArray addObject:model];
        }
    }
    return _weekDayArray;
}
-(NSMutableArray<CalendarModel *> *)dateArray{
    if (!_dateArray) {
        _dateArray = [NSMutableArray array];
    }
    return _dateArray;
}
-(NSMutableArray<NSArray *> *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
        [_datas addObject:self.weekDayArray];
        [_datas addObject:self.dateArray];
    }
    return _datas;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [self initWithFrame:frame collectionViewLayout:[[CalendarCollectionViewFlowLayout alloc] init]]) {
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.dataSource = self;
    self.delegate = self;
    self.contentInset = UIEdgeInsetsMake(0, calendarEdgeSpacing, 0, calendarEdgeSpacing);
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = NO;
    [self registerClass:[CalendarCollectionViewCell class] forCellWithReuseIdentifier:calendarCellIdent];
}

-(void)setDate:(NSDate *)date{
    _date = date;
    [[NSNotificationCenter defaultCenter] postNotificationName:CalendarChangeHeaderTitleNotification object:nil userInfo:@{@"info" : [NSString stringWithFormat:@"%.2ld-%ld",[CalendarDateHelper month:date],[CalendarDateHelper year:date]]}];
    [self updateDatasWithDate:date];
    [self reloadData];
}

-(void)updateDatasWithDate:(NSDate *)date{
    [self.dateArray removeAllObjects];
    NSInteger daysInThisMonth = [CalendarDateHelper totalDaysInMonth:date];
    NSInteger firstWeekDay = [CalendarDateHelper firstWeekDayInThisMonth:date];
    for (NSInteger i=0; i<35; i++) {
        NSInteger day = i - firstWeekDay + 1;
        CalendarModel *model = [[CalendarModel alloc] initWithDate:_date index:day today:_today];
        if (i < firstWeekDay || i > firstWeekDay + daysInThisMonth - 1) {
            model.date = nil;
        }else{
            model.date = [NSString stringWithFormat:@"%ld",day];
        }
        [self.dateArray addObject:model];
    }
}

#pragma mark-  数据源代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.datas.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas[section].count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:calendarCellIdent forIndexPath:indexPath];
    cell.model = self.datas[indexPath.section][indexPath.item];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CalendarModel *model = self.datas[indexPath.section][indexPath.item];
    if (indexPath.section == 0 || [model.date isEqualToString:@""] || !model.date) {
        return;
    }
    model.backgroundColor = [UIColor colorWithRed:0.986 green:0.009 blue:0.035 alpha:0.302];
    [self reloadItemsAtIndexPaths:@[indexPath]];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
