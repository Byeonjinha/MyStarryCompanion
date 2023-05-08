//
//  BMGPlayBtnView.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/05/08.
//

import SwiftUI

struct BMGPlayBtnView: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Button(action: {
                    if vm.isPlaying {
                        maudioPlayer.pause()
                        vm.angle = 0
                    } else {
                        maudioPlayer.play()
                        
                        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                            vm.angle = 360
                        }
                    }
                    vm.isPlaying.toggle()
                }) {
                    Image(systemName: vm.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .foregroundColor( vm.isPlaying ? .pink : .none)
                        .rotationEffect( .degrees(vm.angle))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: w * 0.08, height: h * 0.08)
                        .padding()
                }.overlay(
                    ServeInfoView(isShowInfo: $vm.isShowInfo,
                                  currentSate: $vm.currentSate,
                                  inputText: "This button allows you to play or pause music.",
                                  offsetXY: [0.5, -0.1], stateNum: 1)
                )
                Spacer()
            }
        }
        .onAppear{
            vm.isPlaying = true
            maudioPlayer.play()
            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                vm.angle = 360
            }
        }
    }
}
