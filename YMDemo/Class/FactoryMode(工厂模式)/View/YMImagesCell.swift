//
//  YMImagesCell.swift
//  YMDemo
//
//  Created by msy on 2017/4/27.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMImagesCell: YMBaseCell {
    override var base: YMBaseModel?{
        didSet{
            let model = base as! YMImagesModel
            imageV1.image = UIImage.init(named: model.imgsrc1!)
            imageV2.image = UIImage.init(named: model.imgsrc2!)
            imageV3.image = UIImage.init(named: model.imgsrc3!)
        }
    }
    
    var imageV1 = UIImageView()
    var imageV2 = UIImageView()
    var imageV3 = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        imageV1.frame = CGRect(x: 5, y: 0, width: (kSCREENW-20)/3, height: 80)
        imageV2.frame = CGRect(x: 10+(kSCREENW-20)/3, y: 0, width: (kSCREENW-20)/3, height: 80)
        imageV3.frame = CGRect(x: 10+(kSCREENW-20)/3*2, y: 0, width: (kSCREENW-20)/3, height: 80)

        self.contentView.addSubview(imageV1)
        self.contentView.addSubview(imageV2)
        self.contentView.addSubview(imageV3)
    }
    
    class func returnHeight() -> CGFloat {
        return 90
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
