//
//  ClockViewController.m
//  UITableViewCellToolbar
//
//  Created by Miclle Zheng on 13-5-8.
//  Copyright (c) 2013年 Miclle. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

#define originalHeight 48.0f
#define expansionHeight 96.0f

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *items;
    NSIndexPath *currentIndexPath;
}

#pragma mark - View management

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"ViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    items = [NSMutableArray array];
    
    for (int i = 0; i < 20; i++) {
        [items addObject:[NSString stringWithFormat:@"Item %d", i + 1]];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString * BuIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:BuIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:BuIdentifier owner:self options:nil] objectAtIndex:0];
        cell.title.text = [items objectAtIndex:indexPath.row];
    }
    
    [currentIndexPath isEqual:indexPath] ? [cell expandActionView] : [cell collapseActionViews];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndexPath = [currentIndexPath isEqual:indexPath] ? nil : indexPath;
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndexPath = nil;
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [currentIndexPath isEqual:indexPath]? expansionHeight : originalHeight;
}

#pragma mark

@end