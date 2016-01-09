
//
//  SelectorView.m
//  SeletorView
//
//  Created by 周彦彤 on 16/1/4.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "SelectorView.h"
#import "SelectTableViewCell.h"
#define INTERFACE_HEIGHT 300
#define UI_SCREEN_FULL_HEIGHT  ([[UIScreen mainScreen] bounds].size.height)
#define UI_SCREEN_FULL_WIDTH   ([[UIScreen mainScreen] bounds].size.width)
#define ROOTVIEW [UIApplication sharedApplication].keyWindow

@interface SelectorView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) SelectTableViewCell *selectCell;

@property (nonatomic,strong) NSMutableArray *chooseArr;
@end

static SelectorView *instance;
@implementation SelectorView

+ (SelectorView *)selectViewInstance {
     SelectorView *selectView = [[SelectorView alloc]initWithFrame:CGRectMake(0, UI_SCREEN_FULL_HEIGHT, UI_SCREEN_FULL_WIDTH, INTERFACE_HEIGHT)];
    [selectView initUI];
    return selectView;
}

- (void)initUI{
    self.backgroundColor=[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1];
    self.chooseArr = [NSMutableArray array];
    self.dataArr = [NSMutableArray array];
    
     //半透明图层
    _transparent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_FULL_WIDTH, UI_SCREEN_FULL_HEIGHT)];
    _transparent.backgroundColor = [UIColor blackColor];
    _transparent.alpha = 0.0;
    UITapGestureRecognizer * close=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissShare)];
    [_transparent addGestureRecognizer:close];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_FULL_WIDTH, INTERFACE_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self loadRequestData];
 }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resign"];
    if (!cell) {
        cell = [[SelectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resign"];
        cell.name = [self.dataArr objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    SelectTableViewCell *cell = (SelectTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selectImg.hidden = !cell.selectImg.hidden;
    if (![self.chooseArr containsObject:[self.dataArr objectAtIndex:indexPath.row]]) {
        if (self.chooseArr.count < 1) {
            [self.chooseArr addObject:[self.dataArr objectAtIndex:indexPath.row]];
        } else if (self.chooseArr.count >= 1) {
            cell.selectImg.hidden = YES;
            [self.chooseArr removeObject:[self.dataArr objectAtIndex:indexPath.row]];
        }
    } else {
        [self.chooseArr removeObject:[self.dataArr objectAtIndex:indexPath.row]];
    }
}

- (void)popSelectView
{
    [ROOTVIEW addSubview:_transparent];
    //内容区域
    [ROOTVIEW addSubview:self];
    [UIView animateWithDuration:0.2 animations:^{
        _transparent.alpha = 0.5;
        self.frame=CGRectMake(0,UI_SCREEN_FULL_HEIGHT-INTERFACE_HEIGHT - 200, UI_SCREEN_FULL_WIDTH, INTERFACE_HEIGHT);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissShare
{
    [UIView animateWithDuration:0.2 animations:^{
        _transparent.alpha = 0.2;
        instance.frame=CGRectMake(0,UI_SCREEN_FULL_HEIGHT, UI_SCREEN_FULL_WIDTH, INTERFACE_HEIGHT);
    } completion:^(BOOL finished) {
        [_transparent removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)loadRequestData {
    self.dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    [self.tableView reloadData];
}

@end
