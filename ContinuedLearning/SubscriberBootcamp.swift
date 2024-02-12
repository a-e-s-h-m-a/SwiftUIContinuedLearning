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
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .map { text -> Bool in
                return text.count > 3 ? true : false
            }
            .assign(to: \.textIsValid, on: self)
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink {  [weak self] _ in
                guard let self = self else { return }
                
                self.count += 1
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
            
            Text(vm.textIsValid.description)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .background(.gray)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

#Preview {
    SubscriberBootcamp()
}
