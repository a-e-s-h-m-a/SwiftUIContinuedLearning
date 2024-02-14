//
//  FileManagerBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-14.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            print("Error occured")
            return
        }
        
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //        let directory3 = FileManager.default.temporaryDirectory
        
        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        let path = directory?.appendingPathComponent("\(name).jpg")
        
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).jpg")
        else {
            print("Error getting path")
            return
        }

        do {
            try data.write(to: path)
            print("Success saving...")
        } catch let error {
            print("Error saving \(error)")
        }
    }
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName = "dog"
    let manager = LocalFileManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        manager.saveImage(image: image, name: imageName)
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
                    vm.saveImage()
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
