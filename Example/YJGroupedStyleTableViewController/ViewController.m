//
//  ViewController.m
//  YJGroupedStyleTableViewController
//
//  Created by Jack Huang on 16/6/6.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSArray *)classNames {
    return @[ @"DefaultSettingViewController",
              @"CustomSettingAViewController",
              @"CustomSettingBViewController"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cls = NSClassFromString(self.classNames[indexPath.row]);
    UIViewController *vc = [cls new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end