//
//  ApiService.swift
//  LikeMindsAssignment
//
//  Created by Aditya Khadke on 24/02/23.
//

import Foundation

import UIKit

class Service: NSObject {

    
    static let shareInstance = Service()
    
    func getAllMovieData(completion: @escaping([SingerModel]?, Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else { return }
                do{
                    var arrMovieData = [SingerModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for song in results.results{
                        arrMovieData.append(SingerModel(artistName: song.artistName!, trackName: song.trackName ?? "Value not found"))
                    }
                    completion(arrMovieData, nil)
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    
}
