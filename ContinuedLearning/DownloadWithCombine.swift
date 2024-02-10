//
//  DownloadWithCombine.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-10.
//

import SwiftUI
import Combine

fileprivate struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published fileprivate var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // 1. signup for monthly subscription for package to be delivered
        // 2. the company would make the package behind the scene
        // 3. recieve the package at your front door
        // 4. make sure box isn't damaged
        // 5. open and make sure the item is correct
        // 6. use the item
        // 7. cancellable at any time
        
        // 1. create the publisher
        // 2. subscribe the publisher
        // 3. receive on main thread
        // 4. tryMap (check that the data is good)
        // 5. decode data
        // 6. sink (put the item into our app)
        // 7.store (cancel subscriptions if needed)
        
        URLSession.shared.dataTaskPublisher(for: url)
            // default is background // .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] returnedData in
                self?.posts = returnedData
            })
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output ) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
