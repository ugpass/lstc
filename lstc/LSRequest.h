//
//  LSRequest.h
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RequestMethod) {
    POST,
    GET,
};


@interface LSRequest : NSObject

@property (nonatomic,copy) NSString *url;

@property (nonatomic,assign) RequestMethod method;

- (NSString *)getToken:(NSString *)url method:(RequestMethod)method;

@end

NS_ASSUME_NONNULL_END
