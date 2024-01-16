//
//  LongPressGuestureBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-16.
//

import SwiftUI

struct LongPressGuestureBootcamp: View {
    
    @State var isComplete: Bool = false
    
    var body: some View {
        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
//            .onTapGesture {
//                isComplete.toggle()
//            }
            .onLongPressGesture {
                isComplete.toggle()
            }
    }
}

#Preview {
    LongPressGuestureBootcamp()
}
