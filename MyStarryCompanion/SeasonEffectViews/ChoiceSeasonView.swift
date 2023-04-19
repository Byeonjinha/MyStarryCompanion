//
//  ChoiceSeasonView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import AVKit
import SwiftUI

struct Season {
    let name: String
    let icon: String
    let sound: String
}

struct ChoiceSeasonView: View {
    @Binding var isChoiceSeasons: Bool
    @Binding var seasonState: Int
    @Binding var isSeasonOn: Bool
    
    let seasons = [
        Season(name: "봄", icon: "🌸", sound: "spring.mp3"),
        Season(name: "여름", icon: "☀️", sound: "summer.mp3"),
        Season(name: "가을", icon: "🍁", sound: "autumn.mp3"),
        Season(name: "겨울", icon: "❄️", sound: "winter.mp3")
    ]
    
    @State private var currentSeason: Season?
    
    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.menuColor)
                .opacity(0.7)
                .frame(width: w * 0.36 , height: h * 0.1)
                .padding()
                .overlay(
                    HStack {
                        ForEach(seasons.indices) { seasonIdx in
                            Button(action: {
                                self.currentSeason = seasons[seasonIdx]
                                if seasonState == seasonIdx + 1 && isSeasonOn == true{
                                    seasonState = 0
                                    isSeasonOn = false
                                    
                                } else {
                                    seasonState = seasonIdx + 1
                                    isSeasonOn = true
                                }
                                isChoiceSeasons.toggle()
                            }) {
                                Text(seasons[seasonIdx].icon)
                                    .customFont(size: 5)
                            }
                        }
                    }
                )
        }
    }
}
