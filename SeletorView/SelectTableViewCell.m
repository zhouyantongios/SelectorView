//
//  SelectTableViewCell.m
//  SeletorView
//
//  Created by 周彦彤 on 16/1/4.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "SelectTableViewCell.h"

@interface SelectTableViewCell ()

@property (nonatomic,strong) UILabel *nameLabel;

@end

@implementation SelectTableViewCell
 
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10,40, 40)];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
//    self.nameLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.nameLabel];
    
    self.selectImg = [[UIImageView alloc]initWithFrame:CGRectMake(100, 0, 50, 10)];
    self.selectImg.backgroundColor = [UIColor redColor];
    self.selectImg.hidden = YES;
    [self addSubview:self.selectImg];
}

- (void)setName:(NSString *)name {
    self.nameLabel.text = name;
}

@end
