//
//  DownloadingImagesBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-19.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
