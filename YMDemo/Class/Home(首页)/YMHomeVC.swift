//
//  YMHomeVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/13.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMHomeVC: YMBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleLabel.text = "首页"
        navLeftButton.isHidden = true
        
        view.addSubview(tableView)
    }
    
    lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect.init(x: 0, y: 64, width: kSCREENW, height: kSCREENH-64)
        return tableView
    }()
    
    // 数据
    lazy var dataArray : NSArray = {
        // 下拉加载 动画 未实现
        // 网络请求 未实现 https
        var arr:[String] = ["登录","AlertView","TableView(联动)","RSA/RSA+MD5加密","柱状图","折线图","工厂模式"]
        return arr as NSArray
    }()
    
    // 控制器
    lazy var vcsArray : NSArray = {
        var arr = [YMLoginVC(),YMAlertViewVC(),YMTableVC(),YMRSAVC(),YMBarChartVC(),YMLineChartVC(),YMFactroyModeVC()]
        return arr as NSArray
    }()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK:- UITableViewDelegate
extension YMHomeVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cellID")
        cell.selectionStyle = .none
        cell.textLabel?.text = dataArray[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = (vcsArray[indexPath.row] as! UIViewController)
        navigationController?.pushViewController(vc, animated: true)
    }
}
