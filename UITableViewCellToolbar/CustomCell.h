//
//  AlarmCell.h
//  UITableViewCellToolbar
//
//  Created by Miclle Zheng on 13-5-8.
//  Copyright (c) 2013年 Miclle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *contentViews;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIImageView *arrow;

@property (weak, nonatomic) IBOutlet UIView *actionViews;

- (void) expandActionView;

- (void) collapseActionViews;

@end
