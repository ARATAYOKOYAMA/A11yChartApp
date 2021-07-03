//
//  NormalLineChartView.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import Accessibility
import UIKit
import Charts

final class NormalLineChartView: UIView {
    
    private let chartView = LineChartView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
//        NotificationCenter.default.addObserver(self, selector: #selector(doWhenEventOccur(_:)), name: NSNotification.Name(UIAccessibility.differentiateWithoutColorDidChangeNotification), object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(chartView)
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelTextColor = .systemGray
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelTextColor = .systemGray
        chartView.leftAxis.gridColor = .systemGray
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
        let sampleData2 = [0.2, 0.17, 0.2, 0.15]
        if UIAccessibility.shouldDifferentiateWithoutColor {
            let entries = sampleData.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element, icon: UIImage(systemName: "paperplane.fill")?.withTintColor(.green)) }
            let dataSet = LineChartDataSet(entries: entries, label: "Tropical")
            dataSet.colors = [.green]
            dataSet.drawCirclesEnabled = false
            
            let entries2 = sampleData2.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element, icon: UIImage(systemName: "book.fill")?.withTintColor(.blue)) }
            let dataSet2 = LineChartDataSet(entries: entries2, label: "Arid")
            dataSet2.colors = [.blue]
            dataSet2.drawCirclesEnabled = false
            
            chartView.data = LineChartData(dataSets: [dataSet, dataSet2])
        } else {
            let entries = sampleData.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element) }
            let dataSet = LineChartDataSet(entries: entries, label: "Tropical")
            dataSet.colors = [.green]
            dataSet.drawCirclesEnabled = false
            
            let entries2 = sampleData2.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element) }
            let dataSet2 = LineChartDataSet(entries: entries2, label: "Arid")
            dataSet2.colors = [.blue]
            dataSet2.drawCirclesEnabled = false
            
            chartView.data = LineChartData(dataSets: [dataSet, dataSet2])
        }
    }
}
