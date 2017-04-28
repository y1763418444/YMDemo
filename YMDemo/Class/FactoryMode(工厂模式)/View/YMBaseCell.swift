//
//  YMBaseCell.swift
//  YMDemo
//
//  Created by msy on 2017/4/27.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMBaseCell: UITableViewCell {

    var base:YMBaseModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func initWithModel(model:YMBaseModel) -> Any {
        
        //根据我们的OC函数获取我们的model类名并将其转化为OC字符串
        let modelName = NSString.init(utf8String: object_getClassName(model))
        
        let cellName = (modelName?.substring(to: (modelName?.length)!-5))! + "Cell"
        //唯一标识符可以使用我们所提供的model来给予不同cell所对应的标识来重用。
        let cellType = NSClassFromString(cellName as String) as! YMBaseCell.Type
        let cell = cellType.init()

//        if modelName == "YMDemo.YMImagesModel"{
//            let cell = YMImagesCell.init(style: .default, reuseIdentifier: modelName! as String)
//            return cell
//        }else if modelName == "YMDemo.YMNewModel"{
//            let cell = YMNewCell.init(style: .default, reuseIdentifier: modelName! as String)
//            return cell
//        }else if modelName == "YMDemo.YMMusicModel"{
//            let cell = YMMusicCell.init(style: .default, reuseIdentifier: modelName! as String)
//            return cell
//        }
//        let cell = YMBaseCell.init(style: .default, reuseIdentifier: modelName! as String)
        return cell
    }
    
    class func returnHeight(model:YMBaseModel) -> CGFloat{
        //根据我们的OC函数获取我们的model类名并将其转化为OC字符串
        let modelName = NSString.init(utf8String: object_getClassName(model))

        //唯一标识符可以使用我们所提供的model来给予不同cell所对应的标识来重用。
        if modelName == "YMDemo.YMImagesModel"{
            return YMImagesCell.returnHeight()
        }else if modelName == "YMDemo.YMNewModel"{
            return YMNewCell.returnHeight()
        }else if modelName == "YMDemo.YMMusicModel"{
            return YMMusicCell.returnHeight()
        }
        
        return 0
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
