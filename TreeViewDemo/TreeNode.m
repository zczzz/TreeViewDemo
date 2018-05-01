//
//  TreeNode.m
//  TreeViewDemo
//
//  Created by zcz on 2018/3/5.
//  Copyright © 2018年 zcz. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

+ (instancetype)nodeWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        //KVC
        [self setValuesForKeysWithDictionary:dict];
        //特殊处理children数组
        NSMutableArray *childrenArray = [NSMutableArray array];
        for (NSDictionary *dict in self.children) {
            TreeNode *treeNode = [TreeNode nodeWithDict:dict];
            [childrenArray addObject:treeNode];
        }
        self.children = childrenArray;
    }
    return self;
}

@end
