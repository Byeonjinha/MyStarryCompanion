//
//  CherryBlossomView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct CherryBlossomView: View {
    @State private var petals: [Petals] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(petals) { petal in
                    Image("cherryblossom")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: petal.size, height: petal.size)
                        .rotationEffect(.degrees(petal.rotation))
                        .offset(x: petal.xOffset, y: petal.yOffset)
                }
            }
            .onAppear {
                for _ in 0..<10 {
                    self.petals.append(Petals(frameSize: geometry.size))
                }
            }
            .onReceive(Timer.publish(every: 0.05, on: .main, in: .default).autoconnect()) { _ in
                for i in 0..<self.petals.count {
                    let speed = CGFloat.random(in: 5...15)
                    self.petals[i].yOffset += speed
                    self.petals[i].rotation += Double.random(in: -5...5)
                    
                    if self.petals[i].yOffset > geometry.size.height {
                        self.petals[i].yOffset = -10
                        self.petals[i].xOffset = CGFloat.random(in: 0..<geometry.size.width)
                        self.petals[i].rotation = 0
                    }
                }
            }
        }
    }
}

struct Petals: Identifiable {
    var id = UUID()
    var size: CGFloat = CGFloat.random(in: 30...50)
    var xOffset: CGFloat = CGFloat.random(in: 0..<w)
    var yOffset: CGFloat = CGFloat.random(in: 0..<h)
    var rotation: Double = 0
    
    init(frameSize: CGSize) {
        self.size = CGFloat.random(in: 30...50)
        self.xOffset = CGFloat.random(in: 0..<frameSize.width)
        self.yOffset = CGFloat.random(in: 0..<frameSize.height)
    }
}
