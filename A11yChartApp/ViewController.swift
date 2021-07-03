//
//  ViewController.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit

final class ViewController: UIViewController {
    
    enum Const {
        static let constant: CGFloat = 24.0
    }
    
    var dataPoints: [BarChartModel.DataPoint] {
        return [.init(name: "boblabel", x: 0, y: 5),
                .init(name: "boblabel", x: 1, y: 10),
                .init(name: "boblabel", x: 2, y: 20),
                .init(name: "boblabel", x: 3, y: 30),
                .init(name: "boblabel", x: 4, y: 35),
                .init(name: "boblabel", x: 5, y: 32),
                .init(name: "boblabel", x: 6, y: 18),
                .init(name: "boblabel", x: 7, y: 8),
                .init(name: "boblabel", x: 8, y: 4),
                .init(name: "boblabel", x: 9, y: 3),
                .init(name: "boblabel", x: 10, y: 2),
                .init(name: "boblabel", x: 11, y: 1),
                .init(name: "boblabel", x: 12, y: 0)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let model: BarChartModel = .init(title: "BOB", dataPoints: dataPoints)
        let normalBarChartView = NormalBarChartView(frame: .infinite, model: model)
        normalBarChartView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(normalBarChartView)
        
        NSLayoutConstraint.activate([
            normalBarChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Const.constant),
            normalBarChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Const.constant),
            normalBarChartView.topAnchor.constraint(equalTo: view.topAnchor, constant: Const.constant),
            normalBarChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Const.constant)
        ].compactMap { $0 })
    }

}

