//
//  YMMusicCell.swift
//  YMDemo
//
//  Created by msy on 2017/4/27.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMMusicCell: YMBaseCell {

    var imageV = UIImageView()
    var songNameLabel = UILabel()
    var singerLabel = UILabel()
    
    override var base: YMBaseModel?{
        didSet{
            let model = (base as! YMMusicModel)
            imageV.image = UIImage.init(named: model.plcUrl!)
            songNameLabel.text = model.name
            singerLabel.text = model.singer
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        imageV.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        self.contentView.addSubview(imageV)
        songNameLabel.frame = CGRect(x: 120, y: 10, width: 70, height: 35)
        self.contentView.addSubview(songNameLabel)
        singerLabel.frame = CGRect(x: 120, y: 90, width: 70, height: 30)
        self.contentView.addSubview(singerLabel)
    }
    
    class func returnHeight() -> CGFloat {
        return 120
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
