//
//  CacheBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-18.
//

import SwiftUI

class CacheBootcampViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "dog"
    
    init() {
        getImageFromAssetFolder()
    }
    
    func getImageFromAssetFolder() {
        image = UIImage(named: imageName)
    }
}



struct CacheBootcamp: View {
    
    @StateObject var vm = CacheBootcampViewModel()
    
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
                
                HStack {
                    Button(action: {
                        
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
                
                Text("vm.infoMessage")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                
              Spacer()
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

#Preview {
    CacheBootcamp()
}
