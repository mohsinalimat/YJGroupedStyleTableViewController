//
//  CustomSettingAViewController.m
//  YJGroupedStyleTableViewController
//
//  Created by Jack Huang on 16/6/6.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "CustomSettingAViewController.h"
#import "EmptyViewController.h"

@interface CustomSettingAViewController ()

@end

@implementation CustomSettingAViewController

- (NSArray <NSArray <NSString *> *> *)icons {
    return @[ @[ @"like", @"mail", @"message" ],
              @[ @"money", @"shirt", @"shop" ] ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Header Group";
    
    [self.tableView registerHeaderCellForClassName:@"DemoHeaderCell"];
    self.tableView.extraTopMargin = 65.0;
    
    self.tableView.lineSeparatorIndentationStyle = YJGroupedStyleTableViewSeparatorIndentationStyleFixedMinimumMargin;
    self.tableView.lineSeparatorThicknessLevel = YJGroupedStyleTableViewSeparatorThicknessLevelThicker;
    self.tableView.lineSeparatorColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.00];
    
    self.tableView.supplementaryRegionHeight = 80.0;
    self.tableView.supplementaryRegionBackgroundColor = [UIColor colorWithRed:0.957 green:0.965 blue:0.875 alpha:1.00];
    
    self.tableView.itemCellHeight = 55.0;
    self.tableView.itemCellBackgroundColor = [UIColor colorWithRed:0.988 green:0.965 blue:0.902 alpha:1.00];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - YJGroupedStyleTableViewDataSource

- (NSInteger)numberOfSectionsInGroupedStyleTableView:(YJGroupedStyleTableView *)tableView {
    return self.icons.count;
}

- (NSInteger)tableView:(YJGroupedStyleTableView *)tableView numberOfGroupedItemRowsInSection:(NSInteger)section {
    return self.icons[section].count;
}

#pragma mark - YJGroupedStyleTableViewDelegate

- (void)tableView:(YJGroupedStyleTableView *)tableView configureItemCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.icons[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.icons[indexPath.section][indexPath.row]];
}

- (void)tableView:(YJGroupedStyleTableView *)tableView didSelectGroupedItemRowAtIndexPath:(NSIndexPath *)indexPath {
    EmptyViewController *targetVC = [EmptyViewController new];
    targetVC.view.backgroundColor = [UIColor whiteColor];
    targetVC.contentLabel.text = self.icons[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:targetVC animated:YES];
}

- (void)tableView:(YJGroupedStyleTableView *)tableView didSelectHeaderCell:(__kindof UITableViewCell *)headerCell {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
