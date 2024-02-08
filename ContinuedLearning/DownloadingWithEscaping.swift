//
//  DownloadingWithEscaping.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-08.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadingWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("No data.")
                return
            }
            
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
                    
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but is \(response.statusCode)")
                return
            }
            
            print("SUCCESSFULLY DOWNLOADED DATA!")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(newPost)
            }
            
        }.resume()
    }
}

struct DownloadingWithEscaping: View {
    
    @StateObject var vm = DownloadingWithEscapingViewModel()
    
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
    DownloadingWithEscaping()
}
