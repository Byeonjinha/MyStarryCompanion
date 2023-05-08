//
//  SeasonEffectBtnView.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/05/08.
//

import SwiftUI

struct SeasonEffectBtnView: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    if vm.isSeasonOn == false {
                        vm.isChoiceSeasons.toggle()
                    } else {
                        vm.isSeasonOn = false
                    }
                }) {
                    if vm.isSeasonOn == false {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: w * 0.08, height: h * 0.08)
                            .padding()
                    } else {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .foregroundColor(.pink)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: w * 0.08, height: h * 0.08)
                            .padding()
                    }
                }
                .overlay(
                    ServeInfoView(isShowInfo: $vm.isShowInfo,
                                  currentSate: $vm.currentSate,
                                  inputText: "This button allows you to choose seasonal effects.",
                                  offsetXY: [-0.1, -0.1], stateNum: 2)
                )
            }
        }
        .offset(x: w * -0.15)
    }
}
