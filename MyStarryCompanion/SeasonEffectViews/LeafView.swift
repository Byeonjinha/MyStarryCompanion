//
//  SwiftUIView.swift
//  
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct LeafView: View {
    @State private var leaves: [Leaf] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(leaves) { leaf in
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: leaf.size, height: leaf.size)
                        .rotationEffect(.degrees(leaf.rotation))
                        .offset(x: leaf.xOffset, y: leaf.yOffset)
                }
            }
            .onAppear {
                for _ in 0..<10 {
                    self.leaves.append(Leaf(frameSize: geometry.size))
                }
            }
            .onReceive(Timer.publish(every: 0.14, on: .main, in: .default).autoconnect()) { _ in
                for i in 0..<self.leaves.count {
                    let speed = CGFloat.random(in: 10...30)
                    self.leaves[i].yOffset += speed
                    self.leaves[i].xOffset += CGFloat.random(in: -20...20) // 왼쪽으로도 흔들리게 함
                    
                    // xOffset가 화면 밖으로 나가지 않도록 제한
                    self.leaves[i].xOffset = max(0, min(self.leaves[i].xOffset, geometry.size.width))
                    
                    self.leaves[i].rotation += Double.random(in: -20...20)
                    
                    if self.leaves[i].yOffset > geometry.size.height {
                        self.leaves[i].yOffset = -10
                        self.leaves[i].xOffset = CGFloat.random(in: 0..<geometry.size.width)
                        self.leaves[i].rotation = 0
                    }
                }
            }

        }
    }
}
struct Leaf: Identifiable {
    var id = UUID()
    var size: CGFloat = CGFloat.random(in: 20...50)
    var xOffset: CGFloat = CGFloat.random(in: 0..<w)
    var yOffset: CGFloat = CGFloat.random(in: 0..<h)
    var rotation: Double = 0
    var xRotation: Double = 0 // 새로운 x 방향의 회전값 속성 추가
    
    init(frameSize: CGSize) {
        self.size = CGFloat.random(in: 20...50)
        self.xOffset = CGFloat.random(in: 0..<frameSize.width)
        self.yOffset = CGFloat.random(in: 0..<frameSize.height)
    }
}
