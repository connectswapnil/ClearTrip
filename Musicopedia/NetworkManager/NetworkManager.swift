//
//  NetworkManager.swift
//  Musicopedia
//
//  Created by Swapnil on 29/07/23.
//

import Foundation

enum MediaType: String {
    case music
}

struct NetworManager {
    private let session: URLSession
    private let dummyUrl = "https://google.com"

    private func createSession() -> URLSession {
        URLSession.shared
    }

    private func createRequest(_ urlStr: String) -> URLRequest? {
        let mediaUrl = URL(string: urlStr)
        guard let url = mediaUrl else {return nil}
        return URLRequest(url: url)
    }
    
    func getMediaData(mediaType type: MediaType, complelitionHandler: @escaping ([ContentModelProtocol]?) -> Void) {
        let mediaurl = "\(dummyUrl)/\(type.rawValue)"
        guard let request = createRequest(mediaurl) else {return
            complelitionHandler(nil)
        }
        
        session.downloadTask(with: request) { url, urlresponse, error in
            do {
                guard let contentUrl = url else {
                    return complelitionHandler(nil)
                }
                let data = try Data(contentsOf: contentUrl)
                let response = try JSONDecoder().decode(MusicContentModel.self, from: data)
            } catch let error {
                complelitionHandler(nil)
            }
        }.resume()
    }
}
