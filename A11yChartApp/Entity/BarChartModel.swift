//
//  BarChartModel.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

struct BarChartModel {
    let title: String
    let summary: String
    let xAxis: Axis
    let yAxis: Axis
    let dataPoints: [DataPoint]
    
    struct Axis {
        let title: String
        let range: ClosedRange<Double>
    }
    
    struct DataPoint {
        let name: String
        let x: Double
        let y: Double
    }
}
