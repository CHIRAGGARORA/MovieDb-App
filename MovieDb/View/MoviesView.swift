//
//  ContentView.swift
//  MovieDb
//
//  Created by chirag arora on 21/01/23.
//

import SwiftUI

struct MoviesView: View {
    
    
    // @State is a property wrapper
    
    
    @StateObject var viewModel = MoviesViewModel()
    // @StateObject applies only to properties holding ObservableObject
    
    var body: some View {
        Group {
            switch viewModel.state{
            case .loading:
                ProgressView()
            case .error(let error):
                VStack {
                    Text(error.localizedDescription)
                    
                    Button("Retry") {
                        Task {
                            await viewModel.loadMovies()
                        }
                    }
                }
                
                
                
            case .loaded(let movies):
                list(of: movies)
                
                
                
            }
            
        }
        .navigationTitle("Upccoming Movies")
        .task { // in bigger apps dependency injections
            await viewModel.loadMovies()
            
        }
        
        
    }
    
    @ViewBuilder
        func list(of movies: [Movie]) -> some View {
            if movies.isEmpty == false {
                List(movies) { movie in
                    NavigationLink {
                        MovieDetailsView(movie: movie)
                    } label: {
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
                    }
                }
            } else {
                Text("No upcoming movies 😢")
            }
        }
    }

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesView()
        }
    }
}
