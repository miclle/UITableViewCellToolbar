//
//  AlarmCell.m
//  UITableViewCellToolbar
//
//  Created by Miclle Zheng on 13-5-8.
//  Copyright (c) 2013年 Miclle. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize contentViews, title, arrow, actionViews;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void) expandActionView
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, contentViews.frame.size.height + actionViews.frame.size.height)];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.2];
    
    [actionViews setFrame:CGRectMake(actionViews.frame.origin.x, contentViews.frame.size.height, actionViews.frame.size.width, actionViews.frame.size.height)];
    
    [arrow setFrame:CGRectMake((self.frame.size.width - arrow.frame.size.width)/2, (contentViews.frame.size.height - arrow.frame.size.height), arrow.frame.size.width, arrow.frame.size.height)];
    [arrow setAlpha:1.0f];
    
    [UIView commitAnimations];
}

- (void) collapseActionViews
{
    
}

@end
