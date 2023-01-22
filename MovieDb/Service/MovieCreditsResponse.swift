//
//  MovieCreditsResponse.swift
//  MovieDb
//
//  Created by chirag arora on 22/01/23.
//

import Foundation

struct MovieCreditsResponse: Decodable {
    let cast: [MovieCastMember]
}
