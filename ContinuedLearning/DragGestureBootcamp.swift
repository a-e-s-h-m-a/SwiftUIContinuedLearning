//
//  DragGestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-17.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                    Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaledAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                offset = .zero
                            }
                        }
            )
        }
    }
    
    func getScaledAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle = 10.0
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGestureBootcamp()
}
