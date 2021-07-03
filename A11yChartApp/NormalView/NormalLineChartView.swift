//
//  NormalLineChartView.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit
import Charts

final class NormalLineChartView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        let chartView = LineChartView()
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(chartView)
        
        // X軸のラベルの位置を下に設定
        chartView.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        chartView.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.rightAxis.enabled = false
        // ラベルの色を設定
        chartView.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        chartView.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.legend.textColor = .systemGray
        
        chartView.leftAxis.axisMaximum = 2.3
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.labelCount = 5
        
        NSLayoutConstraint.activate([
            chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            chartView.topAnchor.constraint(equalTo: self.topAnchor),
            chartView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].compactMap { $0 })
        
        let sampleData = [1.7, 1.1, 0.8, 0.48]
        let entries = sampleData.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element) }
        let dataSet = LineChartDataSet(entries: entries, label: "Tropical")
        dataSet.colors = [.red]
        
        let sampleData2 = [0.2, 0.17, 0.2, 0.15]
        let entries2 = sampleData2.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element) }
        let dataSet2 = LineChartDataSet(entries: entries2, label: "Arid")
        dataSet2.colors = [.green]
        
        chartView.data = LineChartData(dataSets: [dataSet, dataSet2])
    }
}
