//
//  ContentViewModel.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/04/19.
//
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var angle: Double = 0
    @Published var buttonLocations: [[Double]] = loadButtonLocations(fileName: "buttonLocationsData")
    @Published var clearState = [Bool](repeating: false, count: 12)
    @Published var isChoiceSeasons: Bool = false
    @Published var isfirst: Bool = true
    @Published var isFlipped: Bool = false
    @Published var isOnboarding: Bool = true
    @Published var isOnstarts = [Bool](repeating: false, count: 36)
    @Published var isPlaying: Bool = false
    @Published var isPressed: Bool = false
    @Published var isSeasonOn: Bool = false
    @Published var isShown: Bool = false
    @Published var isShowInfo: Bool = false
    @Published var isTouch: Bool = true
    @Published var scale: CGFloat = 1.0
    @Published var seasonState: Int = 0
    @Published var xOffset: CGFloat = 0.0
    @Published var yOffset: CGFloat = 0.0
    let starLocations: [[Double]] = loadButtonLocations(fileName: "starLocations" )
}
