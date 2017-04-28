//
//  YMTableVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/18.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMTableVC: YMBaseVC {

    @IBOutlet weak var tableView: UITableView!
    var dataArray:NSArray?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "YMTableVC", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleLabel.text = "TableView联动"
        dataArray = ["TableView - TableView","TableView - CollectionView"]
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMTableVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
        cell.selectionStyle = .none
        cell.textLabel?.text = dataArray![indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = TableViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = CollectionViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
