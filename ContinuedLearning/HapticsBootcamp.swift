//
//  HapticsBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-26.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") { HapticManager.instance.notification(type: .success) }
            Button("error") { HapticManager.instance.notification(type: .error) }
            Button("warning") { HapticManager.instance.notification(type: .warning) }
            Divider()
            Button("heavy") { HapticManager.instance.impact(style: .heavy) }
            Button("light") { HapticManager.instance.impact(style: .light) }
            Button("medium") { HapticManager.instance.impact(style: .medium) }
            Button("rigid") { HapticManager.instance.impact(style: .rigid) }
            Button("soft") { HapticManager.instance.impact(style: .soft) }
        }
    }
}

#Preview {
    HapticsBootcamp()
}
