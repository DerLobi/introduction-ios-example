//
//  MovieViewModel.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import Foundation

class MovieViewModel {

    let title: String
    let overview: String
    let imageURL: NSURL

    init(movie: Movie) {
        title = "\(movie.title) (\(movie.year))"
        overview = movie.overview
        imageURL = movie.imageURL
    }

}
