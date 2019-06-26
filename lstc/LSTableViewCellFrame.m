//
//  LSTableViewCellFrame.m
//  lstc
//
//  Created by fwj on 2019/6/25.
//  Copyright © 2019年 ls. All rights reserved.
//

#import "LSTableViewCellFrame.h"



@implementation LSTableViewCellFrame

- (void)setTcmodel:(LSTCModel *)tcmodel{
    _tcmodel = tcmodel;
    
    _smallImageViewFrame = CGRectMake(10, 10, 44, 44);
    
    _tagNameLabelFrame = CGRectMake(64, 10, kScreenWidth-74, 44);
    
    _bigImageViewFrame = CGRectMake(64, 64, 100, 100);
    
    NSMutableAttributedString *detailText = [[NSMutableAttributedString alloc] initWithString:tcmodel.tag_introduce];
    
    // Create text container
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(kScreenWidth-74, CGFLOAT_MAX);
    container.maximumNumberOfRows = 0;
    
    // Generate a text layout.
    _detailTagNameLabelLayout = [YYTextLayout layoutWithContainer:container text:detailText];
    
    _detailTagNameLabelFrame = CGRectMake(10, 174, _detailTagNameLabelLayout.textBoundingSize.width, _detailTagNameLabelLayout.textBoundingSize.height);
    
    _cellHeight = 10 + 44 + 10 + 100 + _detailTagNameLabelLayout.textBoundingSize.height + 10;
    
}

@end
