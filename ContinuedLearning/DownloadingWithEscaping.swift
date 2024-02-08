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
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { data in
            if let data = data {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    func downloadData(
        fromURL url: URL,
        completionHandler: @escaping (_ data: Data?) -> ()
    ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data.")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
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
