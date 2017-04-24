//
//  YMRSAHandler.h
//  YMDemo
//
//  Created by msy on 2017/4/20.
//  Copyright © 2017年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    KeyTypePublic = 0,
    KeyTypePrivate
}KeyType;

@interface YMRSAHandler : NSObject

// 公钥和私钥路径
- (BOOL)importKeyWithType:(KeyType)type andPath:(NSString*)path;

// 公钥和私钥字符串
- (BOOL)importKeyWithType:(KeyType)type andkeyString:(NSString *)keyString;

// 验证签名 RSA
- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString;

// 验证签名 MD5 + RSA
- (BOOL)verifyMD5String:(NSString *)string withSign:(NSString *)signString;

// 签名
- (NSString *)signString:(NSString *)string;

// 签名MD5
- (NSString *)signMD5String:(NSString *)string;

// 加密
- (NSString *) encryptWithPublicKey:(NSString*)content;

// 解密
- (NSString *) decryptWithPrivatecKey:(NSString*)content;

@end
