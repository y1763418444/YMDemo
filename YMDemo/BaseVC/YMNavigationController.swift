//
//  YMNavigationController.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 隐藏要push的控制器的tabbar
        viewController.hidesBottomBarWhenPushed = true
        
        //压栈
//        let is_life : Bool = (navigationController?.viewControllers.contains(YMHomeVC()))!
//        YMLog("首页控制器 是否存在 \(is_life)")
        super.pushViewController(viewController, animated: animated)
    }


}
