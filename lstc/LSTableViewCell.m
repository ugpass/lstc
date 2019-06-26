//
//  LSTableViewCell.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "LSTableViewCell.h"

@interface LSTableViewCell()

@property (nonatomic, strong)YYLabel *tagNameLabel;

@property (nonatomic, strong)YYLabel *detailTagNameLabel;

@property (nonatomic, strong)UIImageView *bigImageView;

@property (nonatomic, strong)UIImageView *smallImageView;

@end

@implementation LSTableViewCell

+ (LSTableViewCell *)cellForTableView:(UITableView *)tableView{
    static NSString *identifier = @"LSTableViewCell";
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setCellFrame:(LSTableViewCellFrame *)cellFrame{
    _cellFrame = cellFrame;
    [self setContent];
    [self setViewsFrame];
}

- (void)setContent{
    self.backgroundColor = [UIColor whiteColor];
    self.tagNameLabel.text = self.cellFrame.tcmodel.tag_name;
    self.detailTagNameLabel.text = self.cellFrame.tcmodel.tag_introduce;
    [self.bigImageView setImageWithURL:[NSURL URLWithString:self.cellFrame.tcmodel.icon_name] placeholder:[UIImage imageNamed:@"placeholder"]];
    [self.smallImageView setImageWithURL:[NSURL URLWithString:self.cellFrame.tcmodel.small_icon_url] placeholder:[UIImage imageNamed:@"placeholder"]];
}

- (void)setViewsFrame{
    self.tagNameLabel.frame = self.cellFrame.tagNameLabelFrame;
    self.detailTagNameLabel.frame = self.cellFrame.detailTagNameLabelFrame;
    self.bigImageView.frame = self.cellFrame.bigImageViewFrame;
    self.smallImageView.frame = self.cellFrame.smallImageViewFrame;
}

- (YYLabel *)tagNameLabel{
    if (!_tagNameLabel) {
        _tagNameLabel = [YYLabel new];
        _tagNameLabel.displaysAsynchronously = YES;
        [self.contentView addSubview:_tagNameLabel];
    }
    return _tagNameLabel;
}

- (YYLabel *)detailTagNameLabel{
    if (!_detailTagNameLabel) {
        _detailTagNameLabel = [YYLabel new];
        _detailTagNameLabel.displaysAsynchronously = YES;
        _detailTagNameLabel.numberOfLines = 0;
        _detailTagNameLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:_detailTagNameLabel];
    }
    return _detailTagNameLabel;
}

- (UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_bigImageView];
    }
    return _bigImageView;
}

- (UIImageView *)smallImageView{
    if (!_smallImageView) {
        _smallImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_smallImageView];
    }
    return _smallImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
