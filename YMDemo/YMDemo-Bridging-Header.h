//
//  YMDemo-Bridging-Header.h
//  YMDemo
//
//  Created by msy on 2017/4/14.
//  Copyright © 2017年 YM. All rights reserved.
//

/*
 * 1.导入shareSDK 
 * 2.添加依赖库
 * 3.创建桥接文件和配置桥接文件
 * 4.导入需要的文件
 */
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//以下是腾讯SDK的依赖库：
//libsqlite3.dylib

//微信SDK头文件
#import "WXApi.h"
//以下是微信SDK的依赖库：
//libsqlite3.dylib

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"
//以下是新郎微博SDK的依赖库：
//ImageIO.framework

#import <SDWebImage/UIImageView+WebCache.h>


