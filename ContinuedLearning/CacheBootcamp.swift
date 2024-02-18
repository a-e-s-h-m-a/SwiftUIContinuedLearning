//
//  CacheBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-18.
//

import SwiftUI

class CacheManager {
    
    static let instance = CacheManager()
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to the cache..."
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from the cache..."
    }
    
    func get(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
    
}

class CacheBootcampViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    
    let imageName: String = "dog"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetFolder()
    }
    
    func getImageFromAssetFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got image from the cache"
        } else {
            cachedImage = nil
            infoMessage = "Image not found in the cache"
        }
    }
}



struct CacheBootcamp: View {
    
    @StateObject var vm = CacheBootcampViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Text(vm.infoMessage)
                    .font(.headline)
                    .foregroundStyle(.purple)
                
                HStack {
                    Button(action: {
                        vm.saveToCache()
                    }, label: {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .frame(height: 55)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        vm.removeFromCache()
                    }, label: {
                        Text("Delete from cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .frame(height: 55)
                            .cornerRadius(10)
                    })
                }
                
                Button(action: {
                    vm.getFromCache()
                }, label: {
                    Text("Get from cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.green)
                        .frame(height: 55)
                        .cornerRadius(10)
                })
                
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
              Spacer()
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

#Preview {
    CacheBootcamp()
}
