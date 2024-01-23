//
//  MaskBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-23.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(
                    overlayView
                        .mask(starsView)
                )
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: CGFloat(rating)/5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        ZStack {
            HStack {
                ForEach(1..<6){ index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                rating = index
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
