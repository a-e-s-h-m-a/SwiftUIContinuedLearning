//
//  SubscriberBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-12.
//

import SwiftUI
import Combine

class SubscriberBootcampViewModel: ObservableObject {
    
    @Published var count: Int = 0
    // var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        // timer = Timer
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink {  [weak self] _ in
                guard let self = self else { return }
                
                self.count += 1
                
//                if let count = self?.count, count >= 10  {
//                    self?.timer?.cancel()
//                }
                if count >= 10 {
                    for item in cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
    
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberBootcampViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    SubscriberBootcamp()
}
