//
//  YMAlertViewVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/17.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMAlertViewVC: YMBaseVC {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName:"YMAlertViewVC", bundle: nil);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- AlertView
    @IBAction func alertViewClick(_ sender: UIButton) {
        let alertController = UIAlertController.init(title: "标题", message: "提示", preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (alertAction) in
            print(alertAction.title!)
        }))
        self.present(alertController, animated: true)
    }
    
    // MARK:- AlertAction
    @IBAction func alertActionClick(_ sender: UIButton) {
        let alertController = UIAlertController.init(title: "标题", message: "提示", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (alertAction) in
            print(alertAction.title!)
        }))
        self.present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleLabel.text = "AlertController"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
