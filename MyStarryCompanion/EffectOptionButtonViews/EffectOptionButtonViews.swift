//
//  EffectOptionButtonViews.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/05/08.
//

import SwiftUI

struct EffectOptionButtonViews: View {
    @EnvironmentObject var vm: ContentViewModel
    @Binding var currentState: Int
    var body: some View {
        if currentState == 1{
            SeasonEffectBtnView()
            OnboardingBtn()
            BMGPlayBtnView()
        } else if currentState == 2{
            OnboardingBtn()
            BMGPlayBtnView()
            SeasonEffectBtnView()
        } else if currentState == 3{
            BMGPlayBtnView()
            SeasonEffectBtnView()
            OnboardingBtn()
        } else {
            BMGPlayBtnView()
            SeasonEffectBtnView()
            OnboardingBtn()
        }
    }
}
