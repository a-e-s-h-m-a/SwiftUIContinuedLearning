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
        VStack {
            Text("Hello, World!")
                .padding()
    //            .frame(width: 400)
                .background(.red)
                .visualEffect { content, geometryProxy in
                    content
                        .grayscale(geometryProxy.frame(in: .global).minY < 300 ? 1 : 0)
                        //.grayscale(geometryProxy.size.width >= 200 ? 1 : 0)
                }
            
            if showSpacer {
                Spacer()
            }
        }
        .animation(.easeIn, value: showSpacer) // add animation outside of the visual effect modifier
        .onTapGesture {
            showSpacer.toggle()
        }
            
    }
}

#Preview {
    VisualEffectBootcamp()
}
