//
//  SingerModel.swift
//  LikeMindsAssignment
//
//  Created by Aditya Khadke on 24/02/23.
//

import Foundation

import UIKit

class SingerModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    
    init(artistName:String, trackName: String){
        self.artistName = artistName
        self.trackName = trackName
      
    }
}


class ResultsModel: Decodable {
    
    var results = [SingerModel]()
    
    init(results: [SingerModel]) {
        self.results = results
    }
    
}
