//
//  LSTableViewCell.h
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTCModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSTableViewCell : UITableViewCell

@property (nonatomic, strong)YYLabel *tagNameLabel;

@property (nonatomic, strong)YYLabel *detailTagNameLabel;

@property (nonatomic, strong)UIImageView *bigImageView;

@property (nonatomic, strong)UIImageView *smallImageView;

+ (LSTableViewCell *)cellForTableView:(UITableView *)tableView model:(LSTCModel *)model;

@end

NS_ASSUME_NONNULL_END
