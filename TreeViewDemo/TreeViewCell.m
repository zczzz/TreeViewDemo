//
//  TreeViewCell.m
//  TreeViewDemo
//
//  Created by zcz on 2018/3/5.
//  Copyright © 2018年 zcz. All rights reserved.
//

#import "TreeViewCell.h"
#import "TreeNode.h"

@interface TreeViewCell ()

@property (nonatomic, strong) UIButton *switchButton;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation TreeViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.switchButton];
        [self.contentView addSubview:self.nameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //缩进级别
    NSInteger indentationLevel = [self.node.jici integerValue];
    //缩进宽度
    CGFloat indentationLevelW = 10;
    CGRect frame = self.contentView.frame;
    CGFloat switchButtonX = indentationLevel * indentationLevelW;
    CGFloat switchButtonY = 0;
    CGFloat switchButtonW = 32;
    CGFloat switchButtonH = frame.size.height;
    self.switchButton.frame = CGRectMake(switchButtonX, switchButtonY, switchButtonW, switchButtonH);

    CGFloat nameLabelX = CGRectGetMaxX(self.switchButton.frame);
    CGFloat nameLabelY = switchButtonY;
    CGFloat nameLabelW = frame.size.width - switchButtonW;
    CGFloat nameLabelH = switchButtonH;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"TreeViewCell";
    TreeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TreeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setNode:(TreeNode *)node {
    _node = node;
    NSMutableArray *children = node.children;
    if (children.count > 0) {
        if (node.isOpened) {
            [self.switchButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        } else {
            [self.switchButton setImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
        }
        self.switchButton.hidden = NO;
    } else {
        self.switchButton.hidden = YES;
    }

    NSString *name = [node.kmmc stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *codeName = [NSString stringWithFormat:@"%@ %@",node.kmdm,name];
    self.nameLabel.text = codeName;
}

- (UIButton *)switchButton {
    if (!_switchButton) {
        _switchButton = [UIButton new];
        _switchButton.userInteractionEnabled = NO;
    }
    return _switchButton;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.numberOfLines = 0;
        _nameLabel.font = [UIFont systemFontOfSize:15.f];
        _nameLabel.textColor = [UIColor darkGrayColor];
    }
    return _nameLabel;
}

@end
