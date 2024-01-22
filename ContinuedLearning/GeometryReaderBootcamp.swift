//
//  GeometryReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-22.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle().fill(.red)
                    .frame(width: geometry.size.width * 0.6666)
                    //.frame(width: UIScreen.main.bounds.width * 0.6666) // not adapting to the device rotation
                Rectangle().fill(.blue)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
