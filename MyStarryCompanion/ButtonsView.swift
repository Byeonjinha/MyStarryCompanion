//
//  ButtonsView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/13.
//

import SwiftUI

struct ButtonsView: View {
    @Binding var isPressed: Bool
    @Binding var scale: CGFloat
    @Binding var xOffset: CGFloat
    @Binding var yOffset: CGFloat
    @Binding var isShown: Bool
    @Binding var isFlipped: Bool
    @Binding var isOnstars: [Bool]
    @Binding var clearState: [Bool]
    @State var memoOpacity: Double = 0
    @Binding var seasonState: Int
    
    @Binding var buttonLocations: [[Double]]
    
    @State var constellationLocations: [[CGFloat]] = loadButtonLocations(fileName: "constellationLocationsData").map{
        $0.map { CGFloat($0) }
    }
    

    @State var memoLocations: [[Double]] = loadButtonLocations(fileName: "memoLocationsData")
    @State var allQuestions: [[Question]] = loadQuiz()
    

    @State var constellationDiscriptions: [Constellation] = loadDescription()
    let constellations = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "pisces", "aquarius"]
    
    var body: some View {
        ForEach(0..<12) { idx in
            if !clearState[idx] {
                ButtonView(isPressed: self.$isPressed, scale: self.$scale, xOffset: self.$xOffset, yOffset: self.$yOffset, isShown: self.$isShown, isFlipped: self.$isFlipped, constellationXY: $constellationLocations[idx], buttonXY: $buttonLocations[idx], memoXY: $memoLocations[idx], questions: $allQuestions[idx], isOnStars: $isOnstars, clearState: $clearState, seasonState: $seasonState, constellationNum: idx)
            } else {
                ExplainView(constellationsName: constellations[idx], isFlipped: $isFlipped, memoXY: $memoLocations[idx], constellationXY: $constellationLocations[idx], buttonXY: $buttonLocations[idx], scale: $scale, xOffset: $xOffset, yOffset: $yOffset, constellationDiscription: $constellationDiscriptions[idx].description,constellationNum: idx, seasonState: $seasonState)
            }
        }
    }
}

struct QuestionSet: Codable {
    var questions: [Question]
}

struct Question: Codable {
    var text: String
    var choices: [String]
    var answerIndex: Int
    
    func answer(_ choice: String) -> Bool {
        return choice == choices[answerIndex]
    }
}

struct Constellation : Codable{
    var name: String
    var season: String
    var description: String
}

