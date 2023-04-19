//
//  RotatingStar.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/04/19.
//

import SwiftUI

struct RotatingStar: View {
    @State private var angle: Double = 0
    let starXY: [Double]
    var body: some View {
        Image("star")
            .resizable()
            .frame(width: w * 0.05, height: h * 0.05)
            .rotationEffect(.degrees(angle))
            .animation(.easeInOut, value: 0.5)
            .offset(x: w * starXY[0], y: h  * starXY[1])
            .onAppear {
                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                    self.angle = 360
                }
            }
    }
}
