//
//  HashableBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-26.
//

import SwiftUI

struct HashableBootcamp: View {
    
    let data = ["ONE", "TWO", "THREE", "FOUR", "FIVE"]
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
