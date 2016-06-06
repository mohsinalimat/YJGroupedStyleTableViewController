//
//  DefaultSettingViewController.m
//  YJGroupedStyleTableViewController
//
//  Created by Jack Huang on 16/6/6.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "DefaultSettingViewController.h"
#import "EmptyViewController.h"

@interface DefaultSettingViewController ()

@end

@implementation DefaultSettingViewController

- (NSArray <NSArray <NSString *> *> *)icons {
    return @[ @[ @"like", @"mail", @"message" ],
              @[ @"money", @"shirt", @"shop" ] ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Default Group";
    self.tableView.itemCellAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

@end
