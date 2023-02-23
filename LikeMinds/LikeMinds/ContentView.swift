//
//  ContentView.swift
//  LikeMinds
//
//  Created by Aditya Khadke on 23/02/23.
//

//URL : "https://itunes.apple.com/search?term=adele”
//The app will have one screen:
//Screen will show a list of results.
//Each List item should contain - track name, artist name, description, price and artwork image.

import SwiftUI
import Foundation
import URLImage


struct ITunesSearchView: View {
    @ObservedObject var viewModel = ITunesSearchViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.searchResults, id: \.trackId) { result in
                    ITunesSearchResultView(result: result)
                }
            }
            .navigationBarTitle("ITunes Search")
        }
        .onAppear {
            self.viewModel.search()
        }
    }
}

struct ITunesSearchResultView: View {
    let result: ITunesSearchResult
    
    var body: some View {
        HStack {
            
            URLImage(result.artworkUrl100) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            VStack(alignment: .leading) {
                Text(result.trackName)
                    .font(.headline)
                Text(result.artistName)
                
            }
        }
        
    }
    
}
