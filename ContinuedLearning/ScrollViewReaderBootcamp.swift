//
//  ScrollViewReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-17.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                Button("CLICK HERE TO GO TO #30") {
                    withAnimation(.spring()) {
                        proxy.scrollTo(30, anchor: .bottom)
                    }
                }
                
                ForEach(0..<50) { index in
                    Text("This is item #\(index)")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                        .id(index)
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
