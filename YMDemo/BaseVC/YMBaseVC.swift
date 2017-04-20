//
//  YMBaseVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        YMLog("", filePath: NSStringFromClass(self.classForCoder))
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.white
        createNav()
    }
    
    func createNav() {
        
        view.addSubview(self.navTitleImage)
        
        self.navTitleImage.addSubview(self.navTitleLabel)
        
        self.navTitleImage.addSubview(self.navLeftButton)
        
        self.navTitleImage.addSubview(self.navRightButton)
        
        self.navTitleImage.addSubview(self.navLine)
    }
    
    func leftButtonClick() {
        navigationController?.popViewController(animated: true)
    }
    
    func rightButtonClick() {
        
    }
    // 1.导航栏图像
    lazy var navTitleImage : UIImageView = {
        let TitleImage = UIImageView()
        TitleImage.frame = CGRect.init(x: 0, y: 0, width: kSCREENW, height: 64)
        TitleImage.backgroundColor = YMColorHexString(colorStr: "ee7700")
        TitleImage.isUserInteractionEnabled = true
        return TitleImage
    }()
    
    // 2.导航栏居中文字
    lazy var navTitleLabel:UILabel = {
        let TitleLabel = UILabel()
        TitleLabel.frame = CGRect.init(x: 50, y: 27, width: kSCREENW-100, height: 34)
        TitleLabel.textColor = RGBColor(r: 255, g: 255, b: 255)
        TitleLabel.backgroundColor = UIColor.clear
        TitleLabel.textAlignment = .center
        TitleLabel.font = UIFont.systemFont(ofSize: 18.0)
        return TitleLabel
    }()
    
    // 3.导航栏左侧按钮
    lazy var navLeftButton:UIButton = {
        let LeftButton = UIButton()
        LeftButton.frame = CGRect.init(x: 12, y: 22, width: 24, height: 44)
        LeftButton.tintColor = UIColor.black
        LeftButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        LeftButton.setImage(YMImage(name: "icon_tdxq_fanhui"), for: .normal)
        LeftButton.setImage(YMImage(name: "icon_tdxq_fanhui"), for: .selected)
        LeftButton.addTarget(self, action: #selector(leftButtonClick), for: .touchUpInside)
        return LeftButton
    }()
    
    // 4.导航栏右侧按钮
    lazy var navRightButton:UIButton = {
        let RightButton = UIButton()
        RightButton.frame = CGRect.init(x: kSCREENW-60, y: 22, width: 60, height: 44)
        RightButton.tintColor = UIColor.black
        RightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        RightButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        return RightButton
    }()
    
    // 5.分割线
    lazy var navLine:UIView = {
        let Line = UIView()
        Line.frame = CGRect.init(x: 0, y: 63.5, width: kSCREENW, height: 0.5)
        Line.backgroundColor = YMColorHexString(colorStr: "cccccc")
        return Line
    }()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
