//
//  MoviesService.swift
//  MovieDb
//
//  Created by chirag arora on 21/01/23.
//

import Foundation

class Moviesservice {
    func getMoviesFromAPI() async throws -> [Movie] {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        // from sankecase to camelCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decoded =  try decoder.decode(MovieResponse.self, from: data)
        
        
        return decoded.results
        
    }
}
