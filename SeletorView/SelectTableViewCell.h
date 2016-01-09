//
//  SelectTableViewCell.h
//  SeletorView
//
//  Created by 周彦彤 on 16/1/4.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTableViewCell : UITableViewCell

@property (nonatomic,assign) BOOL isShowSelect;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) UIImageView *selectImg;

@end
