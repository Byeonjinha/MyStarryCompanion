import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack {
                    Image("constellations")
                        .resizable()
                        .foregroundColor(.accentColor)
                        .scaleEffect(vm.scale)
                        .animation(.easeInOut, value: 0.5)
                        .offset(x: vm.xOffset, y: vm.yOffset)
                }
                
                ForEach(0..<36) { idx in
                    if vm.isOnstarts[idx] {
                        RotatingStar(starXY: vm.starLocations[idx] )
                            .scaleEffect(vm.scale)
                            .offset(x: vm.xOffset, y: vm.yOffset)
                    }
                }
                ForEach(0..<12) { idx in
                    if vm.clearState[idx] {
                        CompleteView(completeXY: vm.buttonLocations[idx])
                            .scaleEffect(vm.scale)
                            .offset(x: vm.xOffset, y: vm.yOffset)
                    }
                }
                ButtonsView(isPressed: $vm.isPressed,
                            scale: $vm.scale,
                            xOffset: $vm.xOffset,
                            yOffset: $vm.yOffset,
                            isShown: $vm.isShown,
                            isFlipped: $vm.isFlipped,
                            isOnstars: $vm.isOnstarts,
                            clearState: $vm.clearState,
                            seasonState: $vm.seasonState,
                            buttonLocations: $vm.buttonLocations)
                .animation(.easeInOut, value: 0.5)
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
                
                SeasonView(seasonState: $vm.seasonState, isSeasonOn: $vm.isSeasonOn)
                
                if vm.isChoiceSeasons {
                    ChoiceSeasonView(isChoiceSeasons: $vm.isChoiceSeasons,
                                     seasonState: $vm.seasonState,
                                     isSeasonOn: $vm.isSeasonOn)
                }
                
                BMGPlayView()
                
                if vm.isShowInfo {
                    Rectangle()
                        .opacity(0.01)
                        .onTapGesture {
                            vm.currentSate += 1
                            if vm.currentSate >= 4 {
                                vm.isShowInfo = false
                            }
                        }
                }
                if vm.isOnboarding {
                    OnboardingView(isOnboarding: $vm.isOnboarding,
                                   isfirst: $vm.isfirst,
                                   isShowInfo: $vm.isShowInfo, currentState: $vm.currentSate)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
            .colorScheme(.light)
        }
    }
}


