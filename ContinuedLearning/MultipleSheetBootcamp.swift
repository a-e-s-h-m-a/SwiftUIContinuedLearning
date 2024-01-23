//
//  MultipleSheetBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-23.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// solving the problem
// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetBootcamp: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
//    @State var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
//                selectedIndex = 1
//                selectedModel = RandomModel(title: "ONE")
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet, content: {
                NextScreen(selectedModel: RandomModel(title: "ONE"))
            })
            
            Button("Button 2") {
//                selectedIndex = 2
//                selectedModel = RandomModel(title: "TWO")
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                NextScreen(selectedModel: RandomModel(title: "TWO"))
            })
        }
//        .sheet(isPresented: $showSheet, content: {
//            NextScreen(selectedModel: selectedModel)
////            if selectedIndex == 1 {
////                NextScreen(selectedModel: RandomModel(title: "ONE"))
////            } else if selectedIndex == 2 {
////                NextScreen(selectedModel: RandomModel(title: "TWO"))
////            } else {
////                NextScreen(selectedModel: RandomModel(title: "STARTING TITLE"))
////            }
//        })
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetBootcamp()
}
