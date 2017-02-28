//
//  ViewController.m
//  ZBCalendarPicker
//
//  Created by 澳蜗科技 on 2017/2/27.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "ViewController.h"
#import "CalendarViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CalendarViewController *calendarVC;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日历";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editingAction:)];
    self.calendarVC = [[CalendarViewController alloc] init];
    [self.view addSubview:self.calendarVC.view];
}

-(void)editingAction:(UIBarButtonItem *)sender{
    [self.calendarVC startEditing];
}

@end
