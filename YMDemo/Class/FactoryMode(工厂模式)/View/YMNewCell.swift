//
//  YMNewCell.swift
//  YMDemo
//
//  Created by msy on 2017/4/27.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMNewCell: YMBaseCell {
    
    var imageV = UIImageView()
    var titleLabel = UILabel()
    
    override var base: YMBaseModel?{
        didSet{
            let model = base as! YMNewModel
            imageV.image = UIImage(named: model.imgsrc!)
            titleLabel.text = model.title
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        imageV.frame = CGRect(x: 5, y: 5, width: kSCREENW-20, height: 75)
        self.contentView.addSubview(imageV)
        titleLabel.frame = CGRect(x: 10, y: 85, width: kSCREENW-20, height: 40)
        self.contentView.addSubview(titleLabel)
    }
    
    class func returnHeight() -> CGFloat {
        return 125
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
