//
//  CalendarHeaderView.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "CalendarHeaderView.h"
#import "UIView+Frame.h"
#import "CalendarConst.h"

@interface CalendarHeaderView()
@property (nonatomic,strong) UIButton *nextBtn;
@property (nonatomic,strong) UIButton *previousBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation CalendarHeaderView

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setImage:[UIImage imageNamed:@"bt_next"] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
-(UIButton *)previousBtn{
    if (!_previousBtn) {
        _previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_previousBtn setImage:[UIImage imageNamed:@"bt_previous"] forState:UIControlStateNormal];
        [_previousBtn addTarget:self action:@selector(previousBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _previousBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = KCalendarHeaderViewTextColor;
    }
    return _titleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
-(void)setupViews{
    self.backgroundColor = KCalendarHeaderViewBackgroundColor;
    [self addSubview:self.nextBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.previousBtn];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeHeraderTitle:) name:CalendarChangeHeaderTitleNotification object:nil];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGSize imageSize = [UIImage imageNamed:@"bt_previous"].size;
    self.previousBtn.frame = CGRectMake(10, (self.height - imageSize.height) * 0.5, imageSize.width, imageSize.height);
    self.nextBtn.frame = CGRectMake(self.width - 10 - imageSize.width, self.previousBtn.minY, self.previousBtn.width, self.previousBtn.height);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.previousBtn.frame) + 10, 10, CGRectGetMinX(self.nextBtn.frame) - 10 - (self.previousBtn.maxX + 10), 24);
}

-(void)changeHeraderTitle:(NSNotification *)info{
    if (info.userInfo[@"info"]) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@",info.userInfo[@"info"]];
    }
}

-(void)previousBtnAction:(UIButton *)sender{
    if ([self.headerViewDelegate respondsToSelector:@selector(calendarHeaderView:previousBtnAction:)]) {
        [self.headerViewDelegate calendarHeaderView:self previousBtnAction:sender];
    }
}
-(void)nextBtnAction:(UIButton *)sender{
    if ([self.headerViewDelegate respondsToSelector:@selector(calendarHeaderView:nextBtnAction:)]) {
        [self.headerViewDelegate calendarHeaderView:self nextBtnAction:sender];
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
