//
//  BarChartModel.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

struct BarChartModel {
    let title: String
    let dataPoints: [DataPoint]
    
    struct DataPoint {
        let name: String
        let x: Double
        let y: Double
    }
}
