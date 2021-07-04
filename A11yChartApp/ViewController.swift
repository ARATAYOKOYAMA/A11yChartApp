//
//  ViewController.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit
import SwiftUI

final class ViewController: UIViewController {
    
    enum Const {
        static let constant: CGFloat = 16.0
    }
    
    enum ViewType {
        case barCharts
        case lineCharts
        case barUIKitCharts
        case barSwiftUICharts
    }
    
    var dataPoints: [BarChartModel.DataPoint] {
        return [.init(name: "January", x: 1, y: 5),
                .init(name: "February", x: 2, y: 10),
                .init(name: "March", x: 3, y: 20),
                .init(name: "April", x: 4, y: 30),
                .init(name: "May", x: 5, y: 35),
                .init(name: "June", x: 6, y: 32),
                .init(name: "July", x: 7, y: 18),
                .init(name: "August", x: 8, y: 8)]
    }
    
    var viewType: ViewType = .barSwiftUICharts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        switch viewType {
        case .barCharts:
            // BarChartView
            let model: BarChartModel = .init(title: "handshake event",
                                             summary: "楽しかったね",
                                             xAxis: .init(title: "月", range: .init(uncheckedBounds: (lower: 1, upper: 12))),
                                             yAxis: .init(title: "回数", range: .init(uncheckedBounds: (lower: 0, upper: 40))),
                                             dataPoints: dataPoints)
            let chartView = ChartsBarChartView(frame: .infinite, model: model)
            addChartView(chartView: chartView)
        case .lineCharts:
            // LineChartView
            let chartView = ChartsLineChartView()
            addChartView(chartView: chartView)
        case .barUIKitCharts:
            // OriginalBarChartView
            let model: BarChartModel = .init(title: "handshake event",
                                             summary: "楽しかったね",
                                             xAxis: .init(title: "月", range: .init(uncheckedBounds: (lower: 1, upper: 12))),
                                             yAxis: .init(title: "回数", range: .init(uncheckedBounds: (lower: 0, upper: 40))),
                                             dataPoints: dataPoints)
            let chartView = OriginalBarChartView(frame: .infinite, model: model)
            addChartView(chartView: chartView)
        case .barSwiftUICharts:
            // BarGrapthView SwiftUI
            let chartView = UIHostingController(rootView: BarGrapthView(model: .init(title: "handshake event",
                                                                                     summary: "楽しかったね",
                                                                                     xAxis: .init(title: "月", range: .init(uncheckedBounds: (lower: 1, upper: 12))),
                                                                                     yAxis: .init(title: "回数", range: .init(uncheckedBounds: (lower: 0, upper: 40))),
                                                                                     dataPoints: dataPoints)))
            addChartView(chartView: chartView.view)
        }
    }
    
    private func addChartView(chartView: UIView) {
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(chartView)

        NSLayoutConstraint.activate([
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Const.constant),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Const.constant),
            chartView.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.constant),
            chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Const.constant)
        ].compactMap { $0 })
    }

}

