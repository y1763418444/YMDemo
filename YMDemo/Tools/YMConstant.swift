//
//  YMConstant.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit
import Foundation

let HTTPHEADERURL = "http://www.wootide.net/"
let API_URL = "globalTourism/appInterface.do"

// MARK:- 字符串返回颜色值
func YMColorHexString(colorStr:NSString)->UIColor{
    return UIColor.hexColorWithString(colorStr: colorStr as String)
}
// MARK:- 屏幕的宽高
let kSCREENW = UIScreen.main.bounds.size.width
let kSCREENH = UIScreen.main.bounds.size.height
// MARK:- 加载图片
func YMImage(name:String)->(UIImage){
    return UIImage.init(named: name)!
}
// MARK:- RGB颜色
func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat) -> (UIColor){
    return UIColor.rgbColor(r: r, g: g, b: b)
}

//appid appkey
let ShareSDK_Key = "f550edff8c90"
// sina
let SinaSDK_AppId = "730117515"
let  SinaSDK_Secret = "373f08a2456b07b5e4ba1b15cda3091d"
let SDKredirectUri = "http://zc.msy.cn/index.php?app=public&mod=Widget&act=displayAddons&type=sina&addon=Login&hook=no_register_display"
let SDKredirectUri1 = "http://zc.msy.cn/index.php?app=public&mod=Widget&act=displayAddons&type=qzone&addon=Login&hook=no_register_display"
// QQ
let QQSDK_AppId = "1105198624"
let QQSDK_Secret = "OHjkfpQYIu6i3SkB"
// weChat
let WeiXinSDK_AppId = "wx8d09d8f1d1acca7f"
let WeiXinSDK_Secret = "20748d5d05074a53d49c1acd6f7e0964"
