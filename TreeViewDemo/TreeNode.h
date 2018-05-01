//
//  TreeNode.h
//  TreeViewDemo
//
//  Created by zcz on 2018/3/5.
//  Copyright © 2018年 zcz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic , copy) NSString              *xm;
@property (nonatomic , copy) NSString              *sfslhs;
@property (nonatomic , copy) NSString              *kmdm;
@property (nonatomic , copy) NSString              *kmqc;
@property (nonatomic , copy) NSString              *gr;
@property (nonatomic , copy) NSString              *kmid;
@property (nonatomic , copy) NSString              *fzhs_id;
@property (nonatomic , copy) NSString              *fzhs_lb;
@property (nonatomic , copy) NSString              *gys;
@property (nonatomic , copy) NSString              *zy;
@property (nonatomic , copy) NSString              *kmmc;
@property (nonatomic , copy) NSString              *sfmx;
@property (nonatomic , copy) NSString              *kh;
@property (nonatomic , copy) NSString              *fzhs;
@property (nonatomic , copy) NSString              *jici;
@property (nonatomic , copy) NSString              *kmlb;
@property (nonatomic , copy) NSString              *tj;
@property (nonatomic , copy) NSString              *yefx;
@property (nonatomic , copy) NSString              *bm;
@property (nonatomic, strong) NSMutableArray       *children;
@property (nonatomic, assign) BOOL                 isOpened;

+ (instancetype)nodeWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
