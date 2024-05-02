//
//  SliderView.swift
//  GuessTheNumber
//
//  Created by mariya.shabanova on 01.05.2024.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Float
    let alpha: Double
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text("0")
            SliderRepresentation(sliderValue: $sliderValue, alpha: alpha, action: action)
            Text("100")
        }
        .padding()
    }
}

#Preview {
    SliderView(sliderValue: .constant(50.0), alpha: 0.5) {}
}
