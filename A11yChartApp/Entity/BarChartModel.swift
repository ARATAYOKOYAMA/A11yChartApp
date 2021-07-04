//
//  BarChartModel.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import Foundation

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
    
    struct DataPoint: Identifiable {
        let id: String
        let name: String
        let x: Double
        let y: Double
        
        public init(id: String = UUID().uuidString, name: String, x: Double, y: Double) {
            self.id = id
            self.name = name
            self.x = x
            self.y = y
        }
    }
}
