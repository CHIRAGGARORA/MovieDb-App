//
//  ContentView.swift
//  MovieDb
//
//  Created by chirag arora on 21/01/23.
//

import SwiftUI

struct MovieView: View {
    
    @State var movies: [Movie] = []
    // @State is a property wrapper
    
    
    var body: some View {
        List(movies) { movie in
            HStack {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80)
                
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .lineLimit(4)
                }
            }
            .padding()
        }
        .task { // in bigger apps dependency injections
            do {
                let service = Moviesservice()
                movies = try await service.getMoviesFromAPI()
            }catch {
                print(error)
            }
            
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
