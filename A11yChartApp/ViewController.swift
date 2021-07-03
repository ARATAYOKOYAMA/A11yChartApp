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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalBarChartView = NormalBarChartView()
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

