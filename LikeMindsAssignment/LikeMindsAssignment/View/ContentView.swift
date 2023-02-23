//
//  FinalView.swift
//  LikeMinds
//
//  Created by Aditya Khadke on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var arrMovieVM = [SingerViewModel]()
    var body: some View {
        NavigationView {
            List(arrMovieVM, id: \.self) { movie in
                VStack(alignment: .leading) {
                    Text(movie.artistName ?? "")
                    Text(movie.trackName ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("iTunes Search")
            .onAppear(perform: getData)
        }
    }

    func getData(){
        Service.shareInstance.getAllMovieData { (movies, error) in
            if(error==nil){
                self.arrMovieVM = movies?.map({ return SingerViewModel(song: $0) }) ?? []
            }
        }
    }
}


struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
