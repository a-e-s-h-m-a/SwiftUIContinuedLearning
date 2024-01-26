//
//  HashableBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-26.
//

import SwiftUI

struct MyCustomModel: Hashable {
//    let id = UUID().uuidString
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {

    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
//                ForEach(data) { item in
//                    Text(item.id)
//                        .font(.headline)
//                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
