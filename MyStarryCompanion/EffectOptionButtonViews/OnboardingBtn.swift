//
//  OnboardingBtn.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/05/08.
//

import SwiftUI

struct OnboardingBtn: View {
    @EnvironmentObject var vm: ContentViewModel
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    vm.isOnboarding = true
                }) {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: w * 0.08, height: h * 0.08)
                        .padding()
                }
                .overlay(
                    ServeInfoView(isShowInfo: $vm.isShowInfo,
                                  currentSate: $vm.currentSate,
                                  inputText: "If you press this button, you can view the tutorial again.",
                                  offsetXY: [-0.1, -0.1], stateNum: 3)
                )
            }
        }
    }
}
