//
//  MaskBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-23.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 3
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(1..<6){ index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundStyle(rating >= index ? .yellow : .gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
