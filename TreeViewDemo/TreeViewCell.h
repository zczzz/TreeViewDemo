//
//  TreeViewCell.h
//  TreeViewDemo
//
//  Created by zcz on 2018/3/5.
//  Copyright © 2018年 zcz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TreeNode;

@interface TreeViewCell : UITableViewCell

@property (nonatomic, strong) TreeNode *node;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
