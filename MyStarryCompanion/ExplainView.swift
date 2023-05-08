//
//  ExplainView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct ExplainView: View {
    let constellationsName: String
    @Binding var isFlipped: [Bool]
    @Binding var memoXY: [Double]
    @State var memoOpacity: Double = 0
    @Binding var constellationXY: [CGFloat]
    @Binding var buttonXY: [Double]
    @Binding var scale: CGFloat
    @Binding var xOffset: CGFloat
    @Binding var yOffset: CGFloat
    @Binding var constellationDiscription: String
    var constellationNum: Int
    @Binding var seasonState: Int
    var body: some View {
        VStack {
            if isFlipped[constellationNum]{
                ZStack {
                    Rectangle()
                        .foregroundColor(.explainColor)
                        .cornerRadius(20)
                        .frame(width: w * 0.4, height:  h * 0.4)
                        .offset(x: w * memoXY[0] , y: h * memoXY[1])
                    VStack{
                        Image(constellationsName)
                            .resizable()
                            .cornerRadius(20)
                        Text(constellationDiscription)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                    }
                    .background(Color.explainColor)
                    .cornerRadius(20)
                    .frame(width: w * 0.4, height:  h * 0.4)
                    .offset(x: w * memoXY[0] , y: h * memoXY[1])
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: w * 0.044, height:  h * 0.044)
                        .offset(x: w * memoXY[0] + w * 0.16 , y: h * memoXY[1] - h * 0.16)
                        .foregroundColor(.exitColor)
                        .onTapGesture {
                            withAnimation {
                                self.scale = 1
                                self.xOffset = 0.0
                                self.yOffset = 0.0
                                self.isFlipped[constellationNum] = false
                                self.memoOpacity = 0
                            }
                        }
                }
                .opacity(memoOpacity)
            } else {
                if !isFlipped.contains(true) {
                    Button(action: {
                        withAnimation {
                            self.xOffset = w * constellationXY[0]
                            self.yOffset = h * constellationXY[1]
                            isFlipped = [Bool](repeating: false, count: 12)
                            self.isFlipped[constellationNum] = true
                            self.scale = 3
                            self.memoOpacity = 1
                            if self.constellationNum == 0 || self.constellationNum == 5 {
                                self.seasonState = 1
                            } else if self.constellationNum == 1 || self.constellationNum == 2 || self.constellationNum == 9 || self.constellationNum == 10 || self.constellationNum == 11{
                                self.seasonState = 4
                            } else if self.constellationNum == 3 ||  self.constellationNum == 4 ||  self.constellationNum == 7  ||  self.constellationNum == 8 {
                                self.seasonState = 2
                            } else if self.constellationNum == 6 {
                                self.seasonState = 3
                            }
                        }
                    }) {
                        Rectangle()
                            .frame(width: w*0.2, height: h*0.2)
                            .foregroundColor(.clear)
                    }
                    .offset(x: w * buttonXY[0], y: h * buttonXY[1])
                }
            }
        }
        .customFont(size: 3) 
        
    }
}
