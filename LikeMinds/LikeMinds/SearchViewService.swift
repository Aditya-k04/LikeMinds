//
//  SearchViewModel.swift
//  LM
//
//  Created by Aditya Khadke on 23/02/23.
//

import Foundation


class ITunesSearchViewModel: ObservableObject {
    @Published var searchResults = [ITunesSearchResult]()

    func search() {
        ITunesSearchService().search() { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.searchResults = response.results
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
