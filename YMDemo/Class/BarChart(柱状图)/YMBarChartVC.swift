//
//  YMBarChartVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/24.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMBarChartVC: YMBaseVC,YMBarChartViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navTitleLabel.text = "滚动的柱状图"
        createBarChart()
    }
    
    func createBarChart() {

        let chartView = YMBarChartView.init(frame: CGRect.init(x: 0, y: 100, width: kSCREENW, height: 300))
        chartView.backColor = UIColor.white
        chartView.yAxisViewWidth = 52
        chartView.numberOfYAxisElements = 5;
        chartView.xAxisTitleArray = ["4.1asasdasdsdfsadasasas11111", "4.2", "4.3", "4.4", "4.5", "4.6", "4.7", "4.8", "4.9", "4.10", "4.11", "4.12", "4.13", "4.14", "4.15", "4.16", "4.17", "4.18", "4.19", "4.20", "4.21", "4.22", "4.23", "4.24", "4.25", "4.26", "4.27", "4.28", "4.29", "4.30"]
        chartView.xValues = ["300", "550", "700", "200", "370", "890", "760", "430", "210", "30", "300", "550", "700", "200", "370", "890", "760", "430", "210", "30", "300", "550", "700", "200", "370", "890", "760", "430", "210", "30"]
        chartView.yAxisMaxValue = 1000
        chartView.yTitle = "万/人"
        chartView.isBarUserInteractionEnabled = false
        chartView.draw()
        self.view.addSubview(chartView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
