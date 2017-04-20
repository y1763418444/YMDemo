//
//  YMChatVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMChatVC: YMBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleLabel.text = "聊天"
        navLeftButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
