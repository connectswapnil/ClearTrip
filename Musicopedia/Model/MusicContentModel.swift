//
//  MusicContentModel.swift
//  Musicopedia
//
//  Created by Swapnil on 29/07/23.
//

import Foundation

protocol ContentModelProtocol {
    var name: String {get set}
    var dateAdded: Date {get set}
    var url: String {get set}
}
struct MusicContentModel: Codable, ContentModelProtocol {
    var name: String
    var dateAdded: Date
    var url: String
    var artist: String?
    var album: String?
}
