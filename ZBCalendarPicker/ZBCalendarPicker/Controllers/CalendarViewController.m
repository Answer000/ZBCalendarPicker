//
//  CalendarViewController.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarCollectionView.h"
#import "CalendarConst.h"
#import "CalendarHeaderView.h"
#import "CalendarDateHelper.h"

@interface CalendarViewController ()<CalendarHeaderViewDelegate>
@property (nonatomic,strong) CalendarCollectionView *collectionView;
@property (nonatomic,strong) CalendarHeaderView *headerView;
@end

@implementation CalendarViewController

#pragma mark-  懒加载
-(CalendarCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[CalendarCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), KWidth, KWidth)];
        _collectionView.today = [NSDate date];
        _collectionView.date = _collectionView.today;
    }
    return _collectionView;
}
-(CalendarHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[CalendarHeaderView alloc] initWithFrame:CGRectMake(0, 64, KWidth, calendarHeaderViewHeight)];
        _headerView.headerViewDelegate = self;
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.collectionView];
}

-(void)calendarHeaderView:(CalendarHeaderView *)calendarHeaderView previousBtnAction:(UIButton *)sender{
    [UIView transitionWithView:self.collectionView duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
        self.collectionView.date = [CalendarDateHelper lastMonth:self.collectionView.date];
    } completion:nil];
}
-(void)calendarHeaderView:(CalendarHeaderView *)calendarHeaderView nextBtnAction:(UIButton *)sender{
    [UIView transitionWithView:self.collectionView duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
        self.collectionView.date = [CalendarDateHelper nextMonth:self.collectionView.date];
    } completion:nil];
}

-(void)startEditing{
    self.collectionView.userInteractionEnabled = !self.collectionView.userInteractionEnabled;
    self.collectionView.backgroundColor = self.collectionView.userInteractionEnabled ? [UIColor colorWithRed:0.202 green:0.674 blue:0.999 alpha:0.500] : [UIColor whiteColor];
}

@end
