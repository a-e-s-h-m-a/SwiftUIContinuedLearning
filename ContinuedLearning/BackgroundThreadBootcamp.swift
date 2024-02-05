//
//  BackgroundThreadBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-05.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("check1 isMainThread: \(Thread.isMainThread)")
            print("check1 current thread: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                
                print("check2 isMainThread: \(Thread.isMainThread)")
                print("check2 current thread: \(Thread.current)")
            }
            
            
            
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
