//
//  ServeInfoView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/15.
//

import SwiftUI

struct CustomShapeView: View {
    var locationX: Double
    var locationY: Double
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                let radius = min(width, height) / 2.0
                let center = CGPoint(x: width / locationX, y: height / locationY)
                let holeRadius = radius * 0.2
                
                path.addRect(CGRect(x: 0, y: 0, width: width, height: height))
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
    @State var currentSate = 0
    var body: some View {
        ZStack {
            if currentSate == 0{
                CustomShapeView(locationX:  21, locationY: 1.06)
                    .ignoresSafeArea()
                HStack{
                    ServeInfoSpellOutText(inputText: "This button allows you to play or pause music.")
                        .offset( y: h * 0.35)
                        .foregroundColor(.white)
                    Spacer()
                }
            } else if currentSate == 1{
                CustomShapeView(locationX: 1.17, locationY: 1.06)
                    .ignoresSafeArea()
                HStack{
                    ServeInfoSpellOutText(inputText: "This button allows you to choose seasonal effects.")
                        .offset(x:w * 0.4, y: h * 0.35)
                        .foregroundColor(.white)
                    Spacer()
                }
            } else if currentSate == 2{
                CustomShapeView(locationX: 1.04, locationY: 1.06)
                    .ignoresSafeArea()
                HStack{
                    ServeInfoSpellOutText(inputText: "If you press this button, you can view the tutorial again.")
                        .offset(x:w * 0.3, y: h * 0.35)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.01)
                .onTapGesture {
                    currentSate += 1
                    if currentSate >= 3 {
                        isShowInfo = false
                    }
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
