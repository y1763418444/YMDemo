//
//  CollectionViewController.swift
//  YMDemo
//
//  Created by msy on 2017/4/18.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit
let kCollectionViewCell = "CollectionViewCell"
let kCollectionViewHeaderView = "CollectionViewHeaderView"
class CollectionViewController: YMBaseVC, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 64, width: 80, height: kSCREENH-64)
        tableView.rowHeight = 55
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = UIColor.clear
        tableView.register(LeftTableViewCell.self, forCellReuseIdentifier: kLeftTableViewCell)
        return tableView
    }()
    
    fileprivate lazy var flowlayout : LJCollectionViewFlowLayout = {
        let flowlayout = LJCollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 2
        flowlayout.minimumInteritemSpacing = 2
        flowlayout.itemSize = CGSize(width: (kSCREENW - 80 - 4 - 4) / 3, height: (kSCREENW - 80 - 4 - 4) / 3 + 30)
        return flowlayout
    }()
    
    fileprivate lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.init(x: 2 + 80, y: 2 + 64, width: kSCREENW - 80 - 4, height: kSCREENH - 64 - 4), collectionViewLayout: self.flowlayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCell)
        collectionView.register(CollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionViewHeaderView)
        return collectionView
    }()
    
    fileprivate lazy var dataSource = [CollectionCategoryModel]()
    fileprivate lazy var collectionDatas = [[SubCategoryModel]]()
    
    fileprivate var selectIndex = 0
    fileprivate var isScrollDown = true
    fileprivate var lastOffsetY : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navTitleLabel.text = "TableView - CollectionView"
        view.backgroundColor = UIColor.white
        
        configureData()
        
        view.addSubview(tableView)
        view.addSubview(collectionView)
        
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
}

//MARK: - 获取数据
extension CollectionViewController {
    
    func configureData() {
        
        guard let path = Bundle.main.path(forResource: "liwushuo", ofType: "json") else { return }
        
        guard let data = NSData(contentsOfFile: path) as Data? else { return }
        
        guard let anyObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return }
        
        guard let dict = anyObject as? [String : Any] else { return }
        
        guard let datas = dict["data"] as? [String : Any] else { return }
        
        guard let categories = datas["categories"] as? [[String : Any]] else { return }
        
        for category in categories {
            let model = CollectionCategoryModel(dict: category)
            dataSource.append(model)
            
            guard let subcategories = model.subcategories else { continue }
            
            var datas = [SubCategoryModel]()
            for subcategory in subcategories {
                datas.append(subcategory)
            }
            collectionDatas.append(datas)
        }
        
    }
}

//MARK: - TableView DataSource Delegate
extension CollectionViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kLeftTableViewCell, for: indexPath) as! LeftTableViewCell
        let model = dataSource[indexPath.row]
        cell.nameLabel.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        
        // 解决点击 TableView 后 CollectionView 的 Header 遮挡问题。
        scrollToTop(section: selectIndex, animated: true)

        tableView.scrollToRow(at: IndexPath(row: selectIndex, section: 0), at: .top, animated: true)
    }
    
    //MARK: - 解决点击 TableView 后 CollectionView 的 Header 遮挡问题。
    fileprivate func scrollToTop(section: Int, animated: Bool) {
        let headerRect = frameForHeader(section: section)
        let topOfHeader = CGPoint(x: 0, y: headerRect.origin.y - collectionView.contentInset.top)
        collectionView.setContentOffset(topOfHeader, animated: animated)
    }
    
    fileprivate func frameForHeader(section: Int) -> CGRect {
        let indexPath = IndexPath(item: 0, section: section)
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        
        guard let frameForFirstCell = attributes?.frame else {
            return .zero
        }
        
        let headerHeight = collectionView(collectionView, layout: flowlayout, referenceSizeForHeaderInSection: section).height
        return frameForFirstCell.offsetBy(dx: 0, dy: -headerHeight);
    }
}

//MARK: - CollectionView DataSource Delegate
extension CollectionViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDatas[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCell, for: indexPath) as! CollectionViewCell
        let model = collectionDatas[indexPath.section][indexPath.row]
        cell.setDatas(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reuseIdentifier : String?
        if kind == UICollectionElementKindSectionHeader {
            reuseIdentifier = kCollectionViewHeaderView
        }
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier!, for: indexPath) as! CollectionViewHeaderView
        
        if kind == UICollectionElementKindSectionHeader {
            let model = dataSource[indexPath.section]
            view.setDatas(model)
        }
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: kSCREENW, height: 30)
    }
    
    // CollectionView 分区标题即将展示
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        // 当前 CollectionView 滚动的方向向上，CollectionView 是用户拖拽而产生滚动的（主要是判断 CollectionView 是用户拖拽而滚动的，还是点击 TableView 而滚动的）
        if !isScrollDown && collectionView.isDragging {
            selectRow(index: indexPath.section)
        }
    }
    
    // CollectionView 分区标题展示结束
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        // 当前 CollectionView 滚动的方向向下，CollectionView 是用户拖拽而产生滚动的（主要是判断 CollectionView 是用户拖拽而滚动的，还是点击 TableView 而滚动的）
        if isScrollDown && collectionView.isDragging {
            selectRow(index: indexPath.section + 1)
        }
    }
    
    // 当拖动 CollectionView 的时候，处理 TableView
    private func selectRow(index : Int) {
        tableView.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .middle)
    }
    
    // 标记一下 CollectionView 的滚动方向，是向上还是向下
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView == scrollView {
            isScrollDown = lastOffsetY < scrollView.contentOffset.y
            lastOffsetY = scrollView.contentOffset.y
        }
    }
}
