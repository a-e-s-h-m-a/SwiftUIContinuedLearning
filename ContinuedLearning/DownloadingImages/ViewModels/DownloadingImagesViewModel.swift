//
//  DownloadingImagesViewModel.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-19.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] returedPhotoModels in
                self?.dataArray = returedPhotoModels
            }
            .store(in: &cancellables)
    }
}
