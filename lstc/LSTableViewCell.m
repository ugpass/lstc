//
//  LSTableViewCell.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "LSTableViewCell.h"

@interface LSTableViewCell()



@end

@implementation LSTableViewCell

+ (LSTableViewCell *)cellForTableView:(UITableView *)tableView model:(LSTCModel *)model{
    NSString *identifier = NSStringFromClass([LSTableViewCell class]);
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (YYLabel *)tagNameLabel{
    if (!_tagNameLabel) {
        _tagNameLabel = [YYLabel new];
    }
    return _tagNameLabel;
}

- (YYLabel *)detailTagNameLabel{
    if (!_detailTagNameLabel) {
        _detailTagNameLabel = [YYLabel new];
    }
    return _detailTagNameLabel;
}

- (UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
    }
    return _bigImageView;
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
