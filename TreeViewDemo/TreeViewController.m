//
//  TreeViewController.m
//  TreeViewDemo
//
//  Created by zcz on 2018/3/6.
//  Copyright © 2018年 zcz. All rights reserved.
//

#import "TreeViewController.h"
#import "TreeNode.h"
#import "TreeViewCell.h"

@interface TreeViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation TreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TreeViewDemo"; 
}

#pragma mark - Priate
/**
 * 递归删除父节点下的所有子节点
 * @param ChildrenArray 子节点
 */
- (void)deleteChildrenArray:(NSMutableArray *)ChildrenArray {
    for (TreeNode *child in ChildrenArray) {
        if (child.isOpened) {
            [self deleteChildrenArray:child.children];
            child.isOpened = !child.isOpened;
        }
        [self.data removeObject:child];
    }
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TreeViewCell *cell = [TreeViewCell cellWithTableView:tableView];
    TreeNode *node = self.data[indexPath.row];
    cell.node = node;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger index = indexPath.row;
    TreeNode *node = self.data[indexPath.row];
    NSMutableArray *children = node.children;
    //判断当前节点是否包含子节点
    if (children.count > 0) {
        if (!node.isOpened) { //点击展开时，在当前节点后面插入子节点
            for (TreeNode *child in children) {
                index += 1;
                [self.data insertObject:child atIndex:index];
            }
        } else { //点击收起时，删除当前节点底下所有子节点
            [self deleteChildrenArray:children];
        }
        node.isOpened = !node.isOpened;
        //带有动画效果的刷新tableview方法
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Getters
- (NSMutableArray *)data {
    if (!_data) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Tree" ofType:@"json"];
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *dictArray = dataDict[@"data"][@"list"];
        NSMutableArray *nodeArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            TreeNode *node = [TreeNode nodeWithDict:dict];
            [nodeArray addObject:node];
        }
        _data = [nodeArray mutableCopy];
    }
    return _data;
}

@end
