//
//  OriginalBarChartView.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import Accessibility
import UIKit
import SwiftUI

final class OriginalBarChartView: UIView {
    
    enum Const {
        static let spacing: CGFloat = 10.0
    }

    let model: BarChartModel
    private var a11yFrames: [CGRect] = []
    private var isFirstCall: Bool = true
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Const.spacing
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(frame: CGRect,model: BarChartModel) {
        self.model = model
        super.init(frame: frame)
        self.prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        // 一回の動作に限定させる
        if isFirstCall {
            isFirstCall.toggle()
            
            let barHeights: [CGFloat] = model.dataPoints.map { [weak self] point in
                guard let frameHeight = self?.frame.height else { return 0.0 }
                let height = ( point.y / 40 ) * ( frameHeight )
                let barView = UIHostingController(rootView: OriginalBar(frameHeight: frameHeight, height: height))
                barView.view.backgroundColor = .clear
                barView.view.translatesAutoresizingMaskIntoConstraints = false
                self?.stackView.addArrangedSubview(barView.view)
                return height
            }
            stackView.layoutIfNeeded()
            for (index, barHeight) in barHeights.enumerated() {
                let barFrame = stackView.arrangedSubviews[index].convert( stackView.arrangedSubviews[index].frame, from: stackView)
                let x = ( barFrame.width + Const.spacing ) * CGFloat(index)
                let y = barFrame.height - barHeight
                a11yFrames.append(.init(origin: .init(x: x, y: y), size: .init(width: barFrame.width, height: barHeight)))
            }
        }
    }
    
    private func prepareUI() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].compactMap { $0 })
    }

}

extension OriginalBarChartView {
    public override var accessibilityContainerType: UIAccessibilityContainerType {
        get {
                .semanticGroup
        }
        set {}
    }

    public override var accessibilityLabel: String? {
        get {
            model.title
        }
        set {}
    }

    public override var accessibilityElements: [Any]? {
        get {
            return model.dataPoints.enumerated().map { index, point in
                let axElement = UIAccessibilityElement(accessibilityContainer: self)
                axElement.accessibilityValue = "\(point.x) cups, \(point.y) lines of code"
                axElement.accessibilityFrameInContainerSpace = a11yFrames[index]
                return axElement
            }
        }
        set {}
    }
}

extension OriginalBarChartView: AXChart {
    var accessibilityChartDescriptor: AXChartDescriptor? {
        get {
            let xAxis = AXNumericDataAxisDescriptor(title: model.xAxis.title,
                                                    range: model.xAxis.range,
                                                    gridlinePositions: [],
                                                    valueDescriptionProvider: { value in
                return "\(value) cups"
            })
            let yAxis = AXNumericDataAxisDescriptor(title: model.yAxis.title,
                                                    range: model.yAxis.range,
                                                    gridlinePositions: [],
                                                    valueDescriptionProvider: { value in
                return "\(value) lines of code"
            })
            let series = AXDataSeriesDescriptor(name: model.title,
                                                isContinuous: false,
                                                dataPoints: model.dataPoints.map { point in
                AXDataPoint(x: point.x,
                            y: point.y,
                            additionalValues: [],
                            label: point.name)
            })
            return AXChartDescriptor(title: model.title,
                                     summary: model.summary,
                                     xAxis: xAxis,
                                     yAxis: yAxis,
                                     additionalAxes: [],
                                     series: [series])
        }
        set {}
    }
}
