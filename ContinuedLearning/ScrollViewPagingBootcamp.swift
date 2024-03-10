//
//  ScrollViewPagingBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-03-10.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
        VStack {
            Button("SCROLL TO") {
                scrollPosition = (0..<20).randomElement()
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                            .overlay {
                                Text("\(index)").foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)// to see
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
                            //.containerRelativeFrame(.horizontal, alignment: .center) // like tiktok
                    }
                }
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
        }
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<10) { index in
//                    Rectangle()
//                        //.frame(width: 300, height: 300)
//                        .overlay {
//                            Text("\(index)").foregroundStyle(.white)
//                        }
//                        .frame(maxWidth: .infinity)
//                        //.padding(.vertical, 10)// to see
//                        .containerRelativeFrame(.vertical, alignment: .center) // like tiktok
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
