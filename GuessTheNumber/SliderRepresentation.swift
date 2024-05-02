//
//  SliderRepresentation.swift
//  GuessTheNumber
//
//  Created by mariya.shabanova on 01.05.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    let alpha: Double
    let action: () -> Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumTrackTintColor = UIColor(.blue)
        slider.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didValueChange),
            for: .editingChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue, action: {}, alpha: alpha)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var sliderValue: Float
        let alpha: Double
        let action: () -> Void
        
        init(sliderValue: Binding<Float>, action: @escaping () -> Void, alpha: Double) {
            self._sliderValue = sliderValue
            self.action = action
            self.alpha = alpha
        }
        
        @objc func didValueChange(_ sender: UISlider) {
            sliderValue = sender.value
            withAnimation {
                action()
            }
        }
    }
}

#Preview {
    SliderRepresentation(sliderValue: .constant(50.0), alpha: 0.5) {}
}
