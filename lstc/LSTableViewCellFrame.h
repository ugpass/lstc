//
//  LSTableViewCellFrame.h
//  lstc
//
//  Created by fwj on 2019/6/25.
//  Copyright © 2019年 ls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSTCModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSTableViewCellFrame : NSObject

@property (nonatomic, assign)CGRect tagNameLabelFrame;
@property (nonatomic, assign)CGRect detailTagNameLabelFrame;
@property (nonatomic, assign)CGRect bigImageViewFrame;
@property (nonatomic, assign)CGRect smallImageViewFrame;

@property (nonatomic, assign)CGFloat cellHeight;

@property (nonatomic, strong)LSTCModel *tcmodel;

@end

NS_ASSUME_NONNULL_END
