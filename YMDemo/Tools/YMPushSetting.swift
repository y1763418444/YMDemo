//
//  YMPushSetting.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

//MARK: - 自定义日志格式
func YMLog<ANY>(_ log : ANY,filePath:String = #file, line:Int = #line, funcName:String = #function)  {
    print()
    print(">>>>>>>>>>>")
    //文件所在路径
    guard let file = filePath.components(separatedBy: "/").last else {
        print("文件不存在")
        return;
    }
    print("   FILE -> " + file)
    
    //行数
    print("   LINE -> \(line)")
    
    //方法
    print("   FUNCTION - >" + funcName)
    
    print(log);
    
    print(">>>>>>>>>>>")
}
