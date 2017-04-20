//
//  YMBaseTabbarVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMBaseTabbarVC: UITabBarController {
    
    fileprivate var vcsName : [String] = ["首页","发现", "聊天","我的"]
    fileprivate let vcsIsa = [YMHomeVC(), YMFindVC(), YMChatVC(), YMMineVC()]

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        
        // 选中颜色
        UITabBar.appearance().tintColor = YMColorHexString(colorStr: "ee7700")

        var vcArray : [UIViewController] = [UIViewController]()
        
        for i in 0..<vcsIsa.count {
            let nav = addChildViewController(vcsIsa[i], title: vcsName[i], image: i+1)
            vcArray.append(nav)
        }
        
        guard  (vcArray.count > 0) else {
            YMLog("没有页面")
            return
        }
        viewControllers = vcArray
    }
    
    fileprivate func addChildViewController(_ childController: UIViewController, title : String, image: Int) -> YMNavigationController {
        childController.title = title
        self.setTabBarImage(childController.tabBarItem, index: image)
        let navVC = YMNavigationController()
        navVC.title = title
        navVC.addChildViewController(childController)
        return navVC
    }
    
    // 图片
    fileprivate func setTabBarImage(_ tabbar : UITabBarItem, index : Int) {
        tabbar.image = UIImage(named: getTabBarName(index, isNormal: true))
        tabbar.selectedImage = UIImage(named:getTabBarName(index, isNormal: false))
    }
    
    fileprivate func getTabBarName(_ index : Int , isNormal : Bool ) -> String {
        if(isNormal) {
            return "tabbar_normal_icon_\(index)"
        }
        else {
            return "tabbar_highlight_icon_\(index)"
        }
    }
    
    class func sharedBaseTabBarViewController() -> (YMBaseTabbarVC){
        let sharedBaseTabBar = YMBaseTabbarVC()
        sharedBaseTabBar.selectedIndex = 0
        return sharedBaseTabBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
