//
//  YMLoginVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMLoginVC: YMBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleLabel.text = "登录"
    }
    
    ////////////////////////////////////////////////////////////////
    // 创建带xib的控制器  需要实现下面两个方法  才会显示界面
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName:"YMLoginVC", bundle: nil);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ////////////////////////////////////////////////////////////////
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:- 微信
extension YMLoginVC{
    @IBAction func weChatClick(_ sender: UIButton) {
        ShareSDK.getUserInfo(SSDKPlatformType.typeWechat) { (result, userInfo, error) in
            YMLog(result)
        }
    }
}

// MARK:- QQ
extension YMLoginVC{
    @IBAction func QQClick(_ sender: UIButton) {
        ShareSDK.getUserInfo(SSDKPlatformType.typeQQ) { (result, userInfo, error) in
            YMLog(result)
        }
    }
}

// MARK:- 新浪
extension YMLoginVC{
    @IBAction func sinaClick(_ sender: UIButton) {
        ShareSDK.getUserInfo(SSDKPlatformType.typeSinaWeibo) { (result, userInfo, error) in
            YMLog(result)
        }
    }
}

