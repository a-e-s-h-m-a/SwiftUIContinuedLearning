//
//  ScrollViewPagingBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-03-10.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .overlay {
                            Text("\(index)").foregroundStyle(.white)
                        }
                }
            }
        }
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
