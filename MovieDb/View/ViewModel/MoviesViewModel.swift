//
//  MoviesViewModel.swift
//  MovieDb
//
//  Created by chirag arora on 22/01/23.
//

import Foundation


@MainActor  // Main thread
class MoviesViewModel: ObservableObject {
    
    enum State {
        case loading
        case loaded(movies: [Movie])
        case error(Error)
        
    }
    
    @Published var state: State = .loaded(movies: .mock)
    
    let service = Moviesservice()
    
    func loadMovies() async {
        do {
            let movies = try await service.getMoviesFromAPI()
            state = .loaded(movies: movies)
        }catch {
            state = .error(error)
        }
        
    }
}
