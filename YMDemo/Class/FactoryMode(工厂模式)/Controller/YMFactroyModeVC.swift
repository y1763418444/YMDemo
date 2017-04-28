//
//  YMFactroyModeVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/27.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMFactroyModeVC: YMBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        navTitleLabel.text = "工厂模式"
        self.view.addSubview(tableView)
        self.tableView.reloadData()
    }
    
    lazy var tableView:UITableView = {
        let tempTab = UITableView()
        tempTab.frame = CGRect(x: 0, y: 64, width: kSCREENW, height: kSCREENH-64)
        tempTab.delegate = self
        tempTab.dataSource = self
        tempTab.separatorStyle = .none
        return tempTab
    }()
    
    lazy var dataArray:NSArray = {
        let tempArr = NSMutableArray()
        let path = Bundle.main.path(forResource: "data", ofType: "plist")
        let arr = NSArray.init(contentsOfFile: path!)
        for dict in arr! {
            let dataModel = YMBaseModel.initWithDictionary(dictionary: dict as! [String : Any])
            tempArr.add(dataModel)
        }
        return tempArr
    }()
    
    func createTableView() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension YMFactroyModeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 根据我们的indexPath.row获取我们对应的model
        let baseModel = self.dataArray[indexPath.row]
        
        // 根据取出来的model获取其对应的类名
        let modelName = NSString.init(utf8String: object_getClassName(baseModel))
        let cellName = (modelName?.substring(to: (modelName?.length)!-5))! + "Cell"
        // 根据不同的唯一标识重用不同的cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellName as String) as? YMBaseCell
        // 如果cell不存在
        if (cell == nil) {
            // 根据我们每行提供的model创建出对应的cell
            // 根据不同需求生产不同的产品
            cell = YMBaseCell.initWithModel(model: baseModel as! YMBaseModel) as? YMBaseCell
            cell?.selectionStyle = .none
        }
        // 赋值
        cell?.base = baseModel as? YMBaseModel
        
        return (cell!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let baseModel = self.dataArray[indexPath.row]
        return YMBaseCell.returnHeight(model:baseModel as! YMBaseModel)
    }
}
