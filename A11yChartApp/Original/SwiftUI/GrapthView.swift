//
//  GrapthView.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/04.
//

import SwiftUI

struct BarGrapthView: View {
    let model: BarChartModel
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea(.all, edges: .all)
            
            VStack() {
                HStack {
                    Text(model.title)
                        .font(.title2)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                
                HStack() {
                    ForEach(model.dataPoints.indices, id: \.self) { index in
                        if index == 0 {
                            GrapthView(point: model.dataPoints[index])
                                .accessibility(hidden: true)
                        } else {
                            GrapthView(point: model.dataPoints[index])
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct GrapthView: View {
    
    enum Const {
        static let textHeight: CGFloat = 20.0
    }
    
    let point: BarChartModel.DataPoint
    
    var body: some View {
        VStack(spacing: 8) {
            
            GeometryReader { reader in
                VStack {
                    Spacer()
                    
                    Text("\(Int(point.y))")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: Const.textHeight)
                    
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(Color.red)
                        .frame(height: calulateHeight(point: point, height: reader.frame(in: .global).height - Const.textHeight ))
                }
                .accessibilityElement(children: .ignore)
                .accessibility(value: Text("\(Int(point.y))times"))
                .accessibility(label: Text(point.name))
            }
            
            VStack {
                Text(point.name)
                    .font(.caption2)
                .foregroundColor(.gray)
                Spacer()
            }
            .frame(height: 44.0)
        }
    }
    
    func calulateHeight(point: BarChartModel.DataPoint, height: CGFloat) -> CGFloat {
        // 最大値とかで計算したほうが良い
        return ( point.y / 40 ) * height
    }
}

struct BarGrapthView_Previews: PreviewProvider {
    
    static var dataPoints: [BarChartModel.DataPoint] {
        return [.init(name: "January", x: 1, y: 5),
                .init(name: "February", x: 2, y: 10),
                .init(name: "March", x: 3, y: 20),
                .init(name: "April", x: 4, y: 30),
                .init(name: "May", x: 5, y: 35),
                .init(name: "June", x: 6, y: 32),
                .init(name: "July", x: 7, y: 18),
                .init(name: "August", x: 8, y: 8)]
    }
    
    static var previews: some View {
        BarGrapthView(model: .init(title: "handshake event",
                                   summary: "楽しかったね",
                                   xAxis: .init(title: "月", range: .init(uncheckedBounds: (lower: 1, upper: 12))),
                                   yAxis: .init(title: "回数", range: .init(uncheckedBounds: (lower: 0, upper: 40))),
                                   dataPoints: dataPoints))
    }
}
