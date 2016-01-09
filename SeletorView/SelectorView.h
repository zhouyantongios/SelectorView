//
//  SelectorView.h
//  SeletorView
//
//  Created by 周彦彤 on 16/1/4.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectorView : UIView{
    NSArray *titles;
}

@property (nonatomic,strong)UIView * transparent;//半透明图层

+ (SelectorView *)selectViewInstance;

- (void)popSelectView;


@end
