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
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 100, height: 100)
            .offset(offset)
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

#Preview {
    DragGestureBootcamp()
}
