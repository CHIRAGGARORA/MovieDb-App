//
//  Moview.swift
//  MovieDb
//
//  Created by chirag arora on 21/01/23.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    var posterURL: URL? {
            URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath)")
    }
    
}

extension Movie {
    static var mock: Movie {
        Movie(id: 507086,
              title: "Jurassic World Dominion",
              overview: "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.",
              posterPath: "/w4c0GTpmEQ1CZQNHndTv2PPgf2p.jpg"
              
        )
    }
}

extension Array<Movie> {
    static var mock: [Movie] {
        [
            Movie(id: 507086, title: "Jurassic World Dominion", overview: "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.", posterPath: "/w4c0GTpmEQ1CZQNHndTv2PPgf2p.jpg"),
            Movie(id: 799876, title: "The Outfit", overview: "Leonard is an English tailor who used to craft suits on London’s world-famous Savile Row. After a personal tragedy, he’s ended up in Chicago, operating a small tailor shop in a rough part of town where he makes beautiful clothes for the only people around who can afford them: a family of vicious gangsters.", posterPath: "/lZa5EB6PVJBT5mxhgZS5ftqdAm6.jpg"),
            Movie(id: 810693, title: "Jujutsu Kaisen 0", overview: "Yuta Okkotsu is a nervous high school student who is suffering from a serious problem—his childhood friend Rika has turned into a curse and won\'t leave him alone. Since Rika is no ordinary curse, his plight is noticed by Satoru Gojo, a teacher at Jujutsu High, a school where fledgling exorcists learn how to combat curses. Gojo convinces Yuta to enroll, but can he learn enough in time to confront the curse that haunts him?", posterPath: "/3pTwMUEavTzVOh6yLN0aEwR7uSy.jpg")
        ]
    }
}
