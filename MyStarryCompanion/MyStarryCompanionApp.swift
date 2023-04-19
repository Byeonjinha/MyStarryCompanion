//
//  MyStarryCompanionApp.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/04/19.
//

import SwiftUI

@main
struct MyStarryCompanionApp: App {
    init() {
        UIView.appearance().isMultipleTouchEnabled = false
        UIView.appearance().isExclusiveTouch = true
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
