//
//  SnowView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct SnowView: View {
    @State private var snowflakes: [Snowflake] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(snowflakes) { snowflake in
                    Image(systemName: "snow")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: snowflake.size, height: snowflake.size)
                        .offset(x: snowflake.xOffset, y: snowflake.yOffset)
                }
            }
            .onAppear {
                for _ in 0..<50 {
                    self.snowflakes.append(Snowflake())
                }
            }
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()) { _ in
                for i in 0..<self.snowflakes.count {
                    self.snowflakes[i].yOffset += 5
                    if self.snowflakes[i].yOffset > geometry.size.height {
                        self.snowflakes[i].yOffset = -10
                    }
                }
            }
        }
    }
}

struct Snowflake: Identifiable {
    var id = UUID()
    var size: CGFloat = CGFloat.random(in: 5...15)
    var xOffset: CGFloat = CGFloat.random(in: 0..<w)
    var yOffset: CGFloat = CGFloat.random(in: 0..<h)
}
