//
//  NSString+LSMD5.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "NSString+LSMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (LSMD5)

- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *md5Str = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        [md5Str  appendFormat:@"%02x",digest[i]];
    }
    return md5Str;
}

@end
