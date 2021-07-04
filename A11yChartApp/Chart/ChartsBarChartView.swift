//
//  ChartsBarChartView.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit
import Charts

final class ChartsBarChartView: UIView {
    
    let model: BarChartModel
    
    init(frame: CGRect,model: BarChartModel) {
        self.model = model
        super.init(frame: frame)
        self.prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        let barChartView = BarChartView()
        
        // X軸のラベルの位置を下に設定
        barChartView.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartView.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.enabled = false
        // ラベルの色を設定
        barChartView.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartView.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.legend.textColor = .systemGray
        
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(barChartView)
        
        NSLayoutConstraint.activate([
            barChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            barChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            barChartView.topAnchor.constraint(equalTo: self.topAnchor),
            barChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].compactMap { $0 })
        

        let entries = model.dataPoints.map { BarChartDataEntry(x: $0.x, y: $0.y) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartView.leftAxis.axisMaximum = 40.0
        barChartView.leftAxis.axisMinimum = 0.0
        barChartView.leftAxis.labelCount = 5
        barChartView.data = data
    }
    
}
