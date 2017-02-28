//
//  CalendarCollectionViewCell.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "CalendarCollectionViewCell.h"
#import "CalendarConst.h"
#import "UIView+Frame.h"

@interface CalendarCollectionViewCell()
@property (nonatomic,strong) UIView *calendarItem;
@property (nonatomic,strong) UILabel *calendarDateLabel;
@property (nonatomic,strong) UITextField *calendarInfoField;
@end

@implementation CalendarCollectionViewCell
-(UIView *)calendarItem{
    if (!_calendarItem) {
        _calendarItem = [[UIView alloc] init];
    }
    return _calendarItem;
}
-(UILabel *)calendarDateLabel{
    if (!_calendarDateLabel) {
        _calendarDateLabel = [[UILabel alloc] init];
        _calendarDateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _calendarDateLabel;
}
-(UITextField *)calendarInfoField{
    if (!_calendarInfoField) {
        _calendarInfoField = [[UITextField alloc] init];
        _calendarInfoField.userInteractionEnabled = NO;
    }
    return _calendarInfoField;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    [self.contentView addSubview:self.calendarItem];
    [self.calendarItem addSubview:self.calendarDateLabel];
    [self.calendarItem addSubview:self.calendarInfoField];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.calendarItem.frame = self.contentView.bounds;
    self.calendarDateLabel.frame = CGRectMake(0, -KItemDateEdgeInsets.top, self.contentView.width, 20);
    self.calendarInfoField.frame = CGRectMake(0, self.calendarDateLabel.maxY + 5 - KItemMessageEdgeInsets.top, self.contentView.width, 20);
    
    self.contentView.layer.cornerRadius = self.width * 0.5;
//    self.clipsToBounds = YES;
}

-(void)setModel:(CalendarModel *)model{
    _model = model;
    self.calendarDateLabel.text = model.date;
    self.calendarDateLabel.height = [self.calendarDateLabel sizeThatFits:CGSizeMake(self.contentView.width, MAXFLOAT)].height;
    self.calendarInfoField.text = model.message ? model.message : @"";
    self.calendarDateLabel.textColor = model.textColor;
    self.calendarInfoField.userInteractionEnabled = model.isPermissEdit;
    self.contentView.backgroundColor = model.backgroundColor;
}

@end
