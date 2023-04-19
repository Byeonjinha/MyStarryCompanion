//
//  CompleteView.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/04/19.
//

import SwiftUI

struct CompleteView: View {
    let completeXY: [Double]
    var body: some View {
        Image("complete")
            .resizable()
            .frame(width: w * 0.25, height: h * 0.25)
            .animation(.easeInOut, value: 0.5)
            .offset(x: w * completeXY[0], y: h * completeXY[1])
    }
}
