//
//  Model.swift
//  LM
//
//  Created by Aditya Khadke on 23/02/23.
//

import Foundation

struct ITunesSearchResponse: Decodable {
    let resultCount: Int
    let results: [ITunesSearchResult]
}

struct ITunesSearchResult: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: URL
    let description: String?
    let trackPrice: Double?
    let trackId: Int
}

