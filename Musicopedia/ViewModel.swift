//
//  ViewModel.swift
//  Musicopedia
//
//  Created by Swapnil on 29/07/23.
//

import Foundation

protocol MusicProtocol: AnyObject {
    func getResponse()
}

class ViewModel {
    private let apiManager: ApiManagerProtocol
    var musicArray: [ContentModelProtocol]
    weak var delegate: MusicProtocol?

    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
        musicArray = [ContentModelProtocol]()
    }
    
    func getMusicData() {
        apiManager.fetchContentData { data in
            self.musicArray = data
            self.delegate?.getResponse()
        }
    }
}
