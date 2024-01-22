//
//  GeometryReaderBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-22.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle().fill(.red)
                .frame(width: UIScreen.main.bounds.width * 0.6666)
            Rectangle().fill(.blue)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GeometryReaderBootcamp()
}
