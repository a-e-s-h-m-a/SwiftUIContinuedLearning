//
//  EscapingBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-06.
//

import SwiftUI

class EscapingBootcampViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
//        text = downloadData2()
        downloadData5 { [weak self] result in
            self?.text = result.data
        }
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data")
            completionHandler(result)
        }
    }
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct DownloadResult {
    let data: String
}

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingBootcampViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
