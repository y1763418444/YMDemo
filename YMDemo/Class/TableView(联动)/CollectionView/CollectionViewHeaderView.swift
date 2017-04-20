//
//  CollectionViewHeaderView.swift
//  YMDemo
//
//  Created by msy on 2017/4/18.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class CollectionViewHeaderView: UICollectionReusableView {
 
    private lazy var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(red: 240, green: 240, blue: 240, alpha: 0.8)

        titleLabel.frame = CGRect(x: 0, y: 5, width: kSCREENW - 80, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
    }
    
    func setDatas(_ model : CollectionCategoryModel) {
        
        guard let name = model.name else { return }
        
        titleLabel.text = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
