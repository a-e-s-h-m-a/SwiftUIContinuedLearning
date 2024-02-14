//
//  FileManagerBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-14.
//

import SwiftUI

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName = "dog"
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Save to file manager")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.blue)
                        .frame(height: 55)
                        .cornerRadius(10)
                })
                
              Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
