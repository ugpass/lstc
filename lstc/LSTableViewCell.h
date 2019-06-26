//
//  LSTableViewCell.h
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTableViewCellFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSTableViewCell : UITableViewCell

@property (nonatomic, strong)LSTableViewCellFrame *cellFrame;

+ (LSTableViewCell *)cellForTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
