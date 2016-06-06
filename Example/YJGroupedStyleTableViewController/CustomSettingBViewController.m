//
//  CustomSettingBViewController.m
//  YJGroupedStyleTableViewController
//
//  Created by Jack Huang on 16/6/6.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "CustomSettingBViewController.h"
#import "EmptyViewController.h"

@interface CustomSettingBViewController ()

@end

@implementation CustomSettingBViewController

- (NSArray <NSArray <NSString *> *> *)icons {
    return @[ @[ @"" ], // first section is preserved for a custom cell
              @[ @"like", @"mail" ],
              @[ @"message", @"money" ],
              @[ @"shirt", @"shop" ] ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Custom Cell Group";
    [self.tableView registerCustomItemCellForClassName:@"DemoCustomCell" inSection:0];
    self.tableView.itemCellAccessoryType = UITableViewCellAccessoryNone;
}

#pragma mark - YJGroupedStyleTableViewDataSource

- (NSInteger)numberOfSectionsInGroupedStyleTableView:(YJGroupedStyleTableView *)tableView {
    return self.icons.count;
}

- (NSInteger)tableView:(YJGroupedStyleTableView *)tableView numberOfGroupedItemRowsInSection:(NSInteger)section {
    return self.icons[section].count;
}

- (UITableViewCellStyle)tableView:(YJGroupedStyleTableView *)tableView groupedItemCellStyleInSection:(NSInteger)section {
    switch (section) {
        case 0: return UITableViewCellStyleDefault;
        case 1: return UITableViewCellStyleSubtitle;
        case 2: case 3: return UITableViewCellStyleValue1;
    }
    return UITableViewCellStyleDefault;
}

#pragma mark - YJGroupedStyleTableViewDelegate

- (BOOL)tableView:(YJGroupedStyleTableView *)tableView shouldHighlightGroupedItemRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) return NO;
    return YES;
}

- (void)tableView:(YJGroupedStyleTableView *)tableView configureItemCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.imageView.image = [UIImage imageNamed:self.icons[indexPath.section][indexPath.row]];
    cell.textLabel.text = self.icons[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = self.icons[indexPath.section][indexPath.row];
    
    switch (indexPath.section) {
        case 2: cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; break;
        case 3: cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; break;
        case 1: {
            if (![cell.contentView.subviews.lastObject isKindOfClass:[UISwitch class]]) {
                UISwitch *switcher = [UISwitch new];
                switcher.center = (CGPoint){ cell.contentView.bounds.size.width - switcher.bounds.size.width,
                    cell.contentView.bounds.size.height / 2 };
                [cell.contentView addSubview:switcher];
            }
        }
    }
}

- (void)tableView:(YJGroupedStyleTableView *)tableView configureSupplementaryCell:(UITableViewCell *)cell forElementOfKind:(NSString *)elementKind inSection:(NSInteger)section withDefaultTextAttributes:(NSDictionary *)attributes {
    if (elementKind == YJGroupedStyleTableViewSupplementarySectionFooter) {
        NSString *text = nil;
        switch (section) {
            case 0: text = @"The section above is loaded a custom item cell."; break;
            case 1: text = @"The section above is using subtitle cell style."; break;
            case 2: text = @"The section above is using value1 cell style."; break;
        }
        if (text) cell.textLabel.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
}

- (void)tableView:(YJGroupedStyleTableView *)tableView didSelectGroupedItemRowAtIndexPath:(NSIndexPath *)indexPath {
    EmptyViewController *targetVC = [EmptyViewController new];
    targetVC.view.backgroundColor = [UIColor whiteColor];
    targetVC.contentLabel.text = self.icons[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:targetVC animated:YES];
}

#pragma mark - UITableViewDelegate

// If you implemented one of the raw UITableViewDelegate method with indexPath parameter, you
// should convert the indexPath first, then use the converted indexPath, not the method parameter.
// For any method from YJGroupedStyleTableViewDataSource / Delegate, the indexPath parameter is converted.
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *itemIndexPath = [self indexPathForGroupedItemConvertedFromRawIndexPath:indexPath];
    NSLog(@"The item at section %@ row %@ is highlighted.", @(itemIndexPath.section), @(itemIndexPath.row));
}

@end
