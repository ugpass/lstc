//
//  LSRequest.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "LSRequest.h"

@implementation LSRequest

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

/*- (NSString *)getToken:(NSString *)url method:(RequestMethod)method{
    _url = url;
    _method = method;
    int time = [self getTimeStamp];
    
    NSString *auth = [NSString stringWithFormat:@"%@?aid=%@&time=%d%@",kRequestToken,kAID,time,kAIDSecret];
    NSDictionary *paramas = @{@"aid":kAID,@"time":@(time),@"auth":[auth md5]};
    
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:@"%@%@",kBaseURL,kRequestToken] parameters:paramas progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    /*NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseURL,kRequestToken]]];
    request.HTTPMethod = @"GET";
    request.allHTTPHeaderFields = @{@"Content-Type":@"application/json"};
    NSDictionary *paramas = @{@"aid":kAID,@"time":@(time),@"auth":[auth md5]};
    NSError *error = nil;
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:paramas options:NSJSONWritingPrettyPrinted error:&error];
    NSURLSessionDataTask *dataTask = [sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@,%ld",error.description,(long)error.code);
        }else{
            NSLog(@"%@",responseObject);
        }
    }];
    return nil;
}
*/
/*
- (int)getTimeStamp{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970];// *1000 是精确到毫秒，不乘就是精确到秒
    
    return (int)time;
}*/

@end
