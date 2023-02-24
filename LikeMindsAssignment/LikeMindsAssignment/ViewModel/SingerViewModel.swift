//
//  SingerViewModel.swift
//  LikeMindsAssignment
//
//  Created by Aditya Khadke on 24/02/23.
//

import Foundation

class SingerViewModel: NSObject {

    var artistName: String?
    var trackName: String?
    
   // D I
    
    init(song:SingerModel){
        self.artistName = song.artistName
        self.trackName = song.trackName
    }
    
}
