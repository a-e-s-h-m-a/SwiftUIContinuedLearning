//
//  RotationGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-16.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = .zero
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = .zero
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
