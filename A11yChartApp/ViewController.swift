//
//  ViewController.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit

final class ViewController: UIViewController {
    
    enum Const {
        static let constant: CGFloat = 16.0
    }
    
    var dataPoints: [BarChartModel.DataPoint] {
        return [.init(name: "boblabel", x: 0, y: 5),
                .init(name: "boblabel", x: 1, y: 10),
                .init(name: "boblabel", x: 2, y: 20),
                .init(name: "boblabel", x: 3, y: 30),
                .init(name: "boblabel", x: 4, y: 35),
                .init(name: "boblabel", x: 5, y: 32),
                .init(name: "boblabel", x: 6, y: 18),
                .init(name: "boblabel", x: 7, y: 8)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // BarChartView
//        let model: BarChartModel = .init(title: "棒グラフ", dataPoints: dataPoints)
//        let normalBarChartView = NormalBarChartView(frame: .infinite, model: model)
//        normalBarChartView.translatesAutoresizingMaskIntoConstraints = false
        
        // LineChartView
        let normalBarChartView = NormalLineChartView()
        normalBarChartView.translatesAutoresizingMaskIntoConstraints = false
        
        // OriginalBarChartView
//        let model: BarChartModel = .init(title: "棒グラフ", dataPoints: dataPoints)
//        let normalBarChartView = OriginalBarChartView(frame: .infinite, model: model)
//        normalBarChartView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(normalBarChartView)
        
        NSLayoutConstraint.activate([
            normalBarChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Const.constant),
            normalBarChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Const.constant),
            normalBarChartView.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.constant),
            normalBarChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Const.constant)
        ].compactMap { $0 })
    }

}

