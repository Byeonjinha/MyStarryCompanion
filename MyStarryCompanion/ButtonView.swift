//
//  ButtonView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/13.
//
import SwiftUI

struct ButtonView: View {
    @Binding var isPressed: Bool
    @Binding var scale: CGFloat
    @Binding var xOffset: CGFloat
    @Binding var yOffset: CGFloat
    @Binding var isShown: Bool
    @Binding var isFlipped: [Bool]
    
    @State var memoOpacity: Double = 0
    
    @Binding var constellationXY: [CGFloat]
    @Binding var buttonXY: [Double]
    @Binding var memoXY: [Double]
    @Binding var questions: [Question]
    @Binding var isOnStars: [Bool]
    @Binding var clearState: [Bool]
    @Binding var seasonState: Int
    
    @State var quizState: [Bool] = [true, true, true, true]

    @State var clearStage: Int = 0
    @State var quiz_flag: Bool = true
    @State var quizNum: Int = 0 {
        didSet {
            quiz_flag = false
        }
    }
    var constellationNum: Int
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        VStack {
            if isFlipped[constellationNum] {
                ZStack {
                    Image("memo")
                        .resizable()
                        .animation(.easeInOut, value: 0.5)
                        .cornerRadius(20)
                        .frame(width: w * 0.4, height:  h * 0.4)
                        .overlay(content: {
                            if quiz_flag {
                                VStack{
                                    HStack {
                                        SpellOutText(quetions: questions, quizNum: $quizNum)
                                        Spacer()
                                    }
                                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                                    ForEach(0..<4) { idx in
                                        Button(action: {
                                            if questions[quizNum].answerIndex == idx{
                                                if quizNum < 2{
                                                    withAnimation {
                                                        isOnStars[(3 * constellationNum) + quizNum] = true
                                                    }
                                                    quizNum += 1
                                                } else if quizNum == 2 {
                                                    withAnimation {
                                                        isOnStars[(3 * constellationNum) + quizNum] = true
                                                        clearState[constellationNum] = true
                                                        self.scale = 1
                                                        self.xOffset = 0.0
                                                        self.yOffset = 0.0
                                                        self.isFlipped[constellationNum] = false
                                                        self.memoOpacity = 0
                                                    }
                                                }
                                                quizState = [true, true, true, true]
                                                
                                            }else{
                                                quizState[idx] = false
                                                 generator.impactOccurred()
                                            }
                                            
                                        }){
                                            HStack {
                                                Text( String(idx + 1) + ") " + questions[quizNum].choices[idx])
                                                    .foregroundColor(quizState[idx] ? .black : .red)
                                                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                                .onDisappear {
                                    Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                                        self.quiz_flag = true
                                        timer.invalidate()
                                    }
                                    
                                }
                                
                            }
                        })
                        .offset(x: w * memoXY[0] , y: h * memoXY[1])
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: w * 0.044, height:  h * 0.044)
                        .offset(x:w * memoXY[0]  + w * 0.16 , y: h * memoXY[1] - h * 0.16)
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
            }
            else {
                if !isFlipped.contains(true){
                    Button(action: {
                        withAnimation {
                            self.xOffset = w * constellationXY[0]
                            self.yOffset = h * constellationXY[1]
                            self.isFlipped = [Bool](repeating: false, count: 12)
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
                    .offset(x: w * buttonXY[0], y: h *  buttonXY[1])
                }
            }
        }
        .customFont(size: 3)
    }
}
