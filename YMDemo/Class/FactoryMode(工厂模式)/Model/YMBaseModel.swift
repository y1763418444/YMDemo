//
//  YMBaseModel.swift
//  YMDemo
//
//  Created by msy on 2017/4/27.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMBaseModel: NSObject {

    class func initWithDictionary(dictionary:[String : Any]) -> YMBaseModel {
        // 先使用当前类（父类）创建出model对象
        var model = YMBaseModel()
        
        // 根据字典中key对应的数据初始化不同的子类对象并将其返回给我们的父类
        let value = dictionary["tag"] as! NSString
        if value .isEqual(to: "news"){
            model = YMNewModel()
        }else if value .isEqual(to: "images"){
            model = YMImagesModel()
        }else if value .isEqual(to: "music"){
            model = YMMusicModel()
        }
        model.setValuesForKeys(dictionary)
        return model
    }
}
