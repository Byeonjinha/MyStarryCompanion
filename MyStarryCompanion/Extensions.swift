//
//  Extensions.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/04/19.
//

import SwiftUI

extension Color {
    static let explainColor = Color("explainColor")
    static let exitColor = Color("exitColor")
    static let menuColor = Color("menuColor")
}

extension UIViewController {
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        self.view.isUserInteractionEnabled = true
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.view.isUserInteractionEnabled = true
    }
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.view.isUserInteractionEnabled = true
    }
}


import SwiftUI

extension View {
    func customFont(size: CGFloat) -> some View {
        return self.modifier(CustomFont(size: size))
    }
}

fileprivate struct CustomFont: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        return content
            .font(Font.custom("Noteworthy", size: w * size / 100))
    }
}


func loadButtonLocations(fileName: String) -> [[Double]] {
    guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        fatalError("Failed to find file in bundle.")
    }
    guard let data = try? Data(contentsOf: fileUrl) else {
        fatalError("Failed to load file from bundle.")
    }
    let decoder = JSONDecoder()

    do {
        let result = try decoder.decode([[Double]].self, from: data)
        return result
    } catch {
        print(error)
        return []
    }
}


func loadQuiz() -> [[Question]] {
    guard let fileUrl = Bundle.main.url(forResource: "quizData", withExtension: "json") else {
        fatalError("Failed to find file in bundle.")
    }
    guard let data = try? Data(contentsOf: fileUrl) else {
        fatalError("Failed to load file from bundle.")
    }
    let decoder = JSONDecoder()

    do {
        let result = try decoder.decode([[Question]].self, from: data)
        return result
    } catch {
        print(error)
        return []
    }
}

func loadDescription() -> [Constellation] {
    guard let fileUrl = Bundle.main.url(forResource: "constellationsData", withExtension: "json") else {
        fatalError("Failed to find file in bundle.")
    }
    guard let data = try? Data(contentsOf: fileUrl) else {
        fatalError("Failed to load file from bundle.")
    }
    let decoder = JSONDecoder()

    do {
        let result = try decoder.decode([Constellation].self, from: data)
        return result
    } catch {
        print(error)
        return []
    }
}

struct SpellOutText: View {
    let quetions: [Question]
    @State private var currentIndex: Int = 0
    @State private var currentText: String = ""
    @Binding var quizNum: Int
    var body: some View {
        Text(currentText)
            .customFont(size: 4)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
                    if currentIndex < quetions[quizNum].text.count {
                        currentText += String(quetions[quizNum].text[quetions[quizNum].text.index(quetions[quizNum].text.startIndex, offsetBy: currentIndex)])
                        currentIndex += 1
                    } else {
                        timer.invalidate()
                    }
                }
            }
        Spacer()
    }
}


let maudioPlayer = mAudioPlayer()
let w = UIScreen.main.bounds.width
let h = UIScreen.main.bounds.height
