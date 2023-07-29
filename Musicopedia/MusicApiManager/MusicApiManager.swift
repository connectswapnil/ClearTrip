//
//  MusicApiManager.swift
//  Musicopedia
//
//  Created by Swapnil on 29/07/23.
//

import Foundation

protocol ApiManagerProtocol {
    func fetchContentData(completion: @escaping ([ContentModelProtocol]) -> Void)
}

struct MusicApiManager: ApiManagerProtocol {
    func fetchContentData(completion: @escaping ([ContentModelProtocol]) -> Void) {
        let tracks = [MusicContentModel(name: "Track 1", dateAdded: Date(), url: "https://www.dummyurl1.com"),
                      MusicContentModel(name: "Track 2", dateAdded: Date(), url: "https://www.dummyurl2.com"),
                      MusicContentModel(name: "Track 3", dateAdded: Date(), url: "https://www.dummyurl3.com"),
                      MusicContentModel(name: "Track 4", dateAdded: Date(), url: "https://www.dummyurl4.com"),
                      MusicContentModel(name: "Track 5", dateAdded: Date(), url: "https://www.dummyurl5.com")]
        completion(tracks)
    }
}
