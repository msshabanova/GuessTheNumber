//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by mariya.shabanova on 01.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = Float.random(in: 0...100)
    @State private var showingAlert = false
    @State private var alpha = 0.5
    private let targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)" )
            SliderView(sliderValue: $sliderValue, alpha: alpha, action: getAlpha)
            Button("Проверь меня!") {
                showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Your score"),
                    message: Text("\(computeScore())")
                )
            }
            Button("Начать заново") {
                sliderValue = Float.random(in: 0...100)
            }
        }
        .padding()
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }
    
    private func getAlpha() {
        self.alpha = 1 - Double(computeScore())/100
    }
}

#Preview {
    ContentView()
}
