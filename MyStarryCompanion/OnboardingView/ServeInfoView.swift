//
//  ServeInfoView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/15.
//

import SwiftUI

struct CustomShapeView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let Bwidth = geometry.size.width * 100
                let Bheight = geometry.size.height * 100
                let width = geometry.size.width
                let height = geometry.size.height
                
                let radius = min(width, height) / 2.0
                let center = CGPoint(x: width/2, y: height/2)
                let holeRadius = radius * 0.5
                
                path.addRect(CGRect(x: -Bwidth/2, y: -Bheight/2, width: Bwidth, height: Bheight))
                let holeRect = CGRect(x: center.x - holeRadius, y: center.y - holeRadius, width: holeRadius * 2, height: holeRadius * 2)
                let holePath = UIBezierPath(ovalIn: holeRect)
                let holeCGPath = holePath.cgPath
                path.addPath(Path(holeCGPath))
            }
            .fill(style: .init(eoFill: true, antialiased: true))
            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.7))
        }
    }
}





struct ServeInfoView: View {
    @Binding var isShowInfo: Bool
    @Binding var currentSate: Int
    
    var body: some View {
        ZStack{
            if currentSate == 1{
                
                CustomShapeView()
                
                HStack{
                    ServeInfoSpellOutText(inputText: "This button allows you to play or pause music.")
                        .offset(x: w * 0.5, y: -h * 0.02)
                        .foregroundColor(.white)
                    Spacer()
                }.frame(width: w)
            } else {
                EmptyView()
            }
        }
    }
}
struct ServeInfoSpellOutText: View {
    @State private var currentIndex: Int = 0
    var inputText: String
    @State var currentText: String = ""
    var body: some View {
        Text(currentText)
            .customFont(size: 3) 
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
                    if currentIndex < inputText.count {
                        currentText += String(inputText[inputText.index(inputText.startIndex, offsetBy: currentIndex)])
                        currentIndex += 1
                    } else {
                        timer.invalidate()
                    }
                }
            }
        Spacer()
    }
}
