//
//  OnboardingView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboarding: Bool
    @Binding var isfirst: Bool
    @Binding var isShowInfo: Bool
    @Binding var currentState: Int
    @State private var currentPageIndex = 0

    let pages = [
        OnboardingPage(imageName: "prevsky", title: "Old night sky", description: "Long ago, the stars in the night sky were beautiful, and we grew up looking at them. We spent happy times looking at and listening to the stories of countless stars and constellations."),
        OnboardingPage(imageName: "airpollution", title: "difficult constellation viewing", description: "Although there are differences depending on the region, currently, in some places, we can no longer easily see the constellations due to physical and environmental problems."),
        OnboardingPage(imageName: "iwant", title: "My Starry Companion app", description: "So, I have created this app for modern children to enjoy and learn about constellations. Shall we go find some stars then?")
    ]

    var body: some View {
        ZStack{
            Rectangle()
                .opacity(0.7)
                .onTapGesture {}
        
            VStack {
                TabView(selection: $currentPageIndex) {
                    ForEach(pages.indices) { index in
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                            .frame(width: w * 0.6, height: h * 0.6 )
                            .overlay(
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                        )
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                Button(action: {
                    if currentPageIndex < pages.count - 1 {
                        currentPageIndex += 1
                    } else {
                        isOnboarding = false
                        currentState = 1
                        if isfirst {
                            isfirst = false
                            isShowInfo = true
                        }
                        
                    }
                }) {
                    Text(currentPageIndex < pages.count - 1 ? "Next" : "Finish")
                        .customFont(size: 4)
                        .frame(width: w * 0.15, height: h * 0.06)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(16)
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack {
            Image(page.imageName)
                .resizable()
                .cornerRadius(30)
                .aspectRatio(contentMode: .fit)
                .padding(32)

            Text(page.title)
                .fontWeight(.bold)
                .customFont(size: 4)
  
                .padding(.top, 16)

            Text(page.description)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
                .customFont(size: 3)
            Spacer()
        }
    }
}

struct OnboardingPage {
    let imageName: String
    let title: String
    let description: String
}
