//
//  AccessibilityTextBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-21.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20)) // can change icon sizes
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        Text("This is some longer text that expands to multiple lines")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            //.truncationMode(.head)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    }
                    // .frame(height: 100) // don't use fixed stuff -> dynamic UI breaks  <> 1
                    .background(.red)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello, world")
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}
