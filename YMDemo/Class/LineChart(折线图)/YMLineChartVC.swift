//
//  YMLineChartVC.swift
//  YMDemo
//
//  Created by msy on 2017/4/25.
//  Copyright © 2017年 YM. All rights reserved.
//

import UIKit

class YMLineChartVC: YMBaseVC,ZFGenericChartDataSource {

    let lineChart = ZFLineChart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleLabel.text = "折线图"
        createLineChart()
    }
    
    func createLineChart() {
        lineChart.frame = CGRect.init(x: 0, y: 64, width: kSCREENW, height: 300)
        lineChart.dataSource = self
        lineChart.unit = "人"
        lineChart.topicLabel.textColor = UIColor.white
        lineChart.isShowSeparate = true
        lineChart.isResetAxisLineMinValue = true
        lineChart.isShadow = false
        lineChart.valueLabelPattern = kPopoverLabelPatternBlank
        lineChart.valueCenterToCircleCenterPadding = 10
        lineChart.unitColor = UIColor.black
        lineChart.axisColor = UIColor.black
        lineChart.axisLineNameColor = UIColor.black
        lineChart.axisLineValueColor = UIColor.black
        lineChart.xLineNameLabelToXAxisLinePadding = 0
        self.view.addSubview(lineChart)
        lineChart.strokePath()
    }
    
    func valueArray(in chart: ZFGenericChart!) -> [Any]! {
        return [["52", "300", "490", "380", "167", "451","52", "300", "490", "380", "167", "451"],
        ["380", "200", "326", "240", "258", "137","380", "200", "326", "240", "258", "137"],
        ["256", "300", "89", "430", "256", "256","256", "300", "89", "430", "256", "256"],
        ];
    }
    
    func nameArray(in chart: ZFGenericChart!) -> [Any]! {
        return ["一年级", "二年级", "三年级", "四年级", "五年级", "六年级","一年级", "二年级", "三年级", "四年级", "五年级", "六年级"];
    }
    
    func colorArray(in chart: ZFGenericChart!) -> [Any]! {
        return [UIColor.blue,UIColor.orange,UIColor.magenta]
    }
    
    func axisLineSectionCount(in chart: ZFGenericChart!) -> Int {
        return 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
