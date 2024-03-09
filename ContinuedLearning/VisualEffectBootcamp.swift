//
//  VisualEffectBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-03-09.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    
    @State private var showSpacer: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometryProxy in
                            content
                                .offset(x: geometryProxy.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
//        VStack {
//            Text("Hello, World!")
//                .padding()
//    //            .frame(width: 400)
//                .background(.red)
//                .visualEffect { content, geometryProxy in
//                    content
//                        .grayscale(geometryProxy.frame(in: .global).minY < 300 ? 1 : 0)
//                        //.grayscale(geometryProxy.size.width >= 200 ? 1 : 0)
//                }
//            
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer) // add animation outside of the visual effect modifier
//        .onTapGesture {
//            showSpacer.toggle()
//        }
            
    }
}

#Preview {
    VisualEffectBootcamp()
}
