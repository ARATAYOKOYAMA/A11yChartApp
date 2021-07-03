//
//  NormalBarChartView.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit
import Charts

final class NormalBarChartView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
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
        
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartView.data = data
    }
    
}
