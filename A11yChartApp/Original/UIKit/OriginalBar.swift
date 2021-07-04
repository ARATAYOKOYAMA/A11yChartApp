//
//  OriginalBar.swift
//  A11yChartApp
//
//  Created by 横山新 on 2021/07/03.
//

import SwiftUI

struct OriginalBar: View {
    let frameHeight: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .frame(height: height)
                .foregroundColor(.blue)
        }
        .frame(height: frameHeight)
    }
}

struct OriginalBar_Previews: PreviewProvider {
    static var previews: some View {
        OriginalBar(frameHeight: 640, height: 300)
            .previewLayout(.sizeThatFits)
    }
}
