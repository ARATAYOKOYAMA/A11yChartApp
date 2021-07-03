//
//  ViewController.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var chartView: LineChartView!
    var chartDataSet: LineChartDataSet!
    // 今回使用するサンプルデータ
    let sampleData = [88.0, 99.0, 93.0, 67.0, 45.0, 72.0, 58.0, 91.0, 81.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // グラフを表示する
        displayChart(data: sampleData)
    }
    
    func displayChart(data: [Double]) {
        // グラフの範囲を指定する
        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
        // プロットデータ(y軸)を保持する配列
        var dataEntries = [ChartDataEntry]()
        
        for (xValue, yValue) in data.enumerated() {
            let dataEntry = ChartDataEntry(x: Double(xValue), y: yValue)
            dataEntries.append(dataEntry)
        }
        // グラフにデータを適用
        chartDataSet = LineChartDataSet(entries: dataEntries, label: "SampleDataChart")
        
        chartDataSet.lineWidth = 5.0 // グラフの線の太さを変更
        chartDataSet.mode = .cubicBezier // 滑らかなグラフの曲線にする
        
        chartView.data = LineChartData(dataSet: chartDataSet)
        
        // X軸(xAxis)
        chartView.xAxis.labelPosition = .bottom // x軸ラベルをグラフの下に表示する
        
        // Y軸(leftAxis/rightAxis)
        chartView.leftAxis.axisMaximum = 100 //y左軸最大値
        chartView.leftAxis.axisMinimum = 0 //y左軸最小値
        chartView.leftAxis.labelCount = 6 // y軸ラベルの数
        chartView.rightAxis.enabled = false // 右側の縦軸ラベルを非表示
        
        // その他の変更
        chartView.highlightPerTapEnabled = false // プロットをタップして選択不可
        chartView.legend.enabled = false // グラフ名（凡例）を非表示
        chartView.pinchZoomEnabled = false // ピンチズーム不可
        chartView.doubleTapToZoomEnabled = false // ダブルタップズーム不可
        chartView.extraTopOffset = 20 // 上から20pxオフセットすることで上の方にある値(99.0)を表示する
        
        chartView.animate(xAxisDuration: 2) // 2秒かけて左から右にグラフをアニメーションで表示する
        
        view.addSubview(chartView)
    }
}

