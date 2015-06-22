//
//  Movie.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import Foundation

class Movie {

    let title: String
    let year: Int
    let overview: String
    let imageURL: NSURL

    init(title: String, year: Int, overview: String, imageURL: NSURL) {
        self.title = title
        self.year = year
        self.overview = overview
        self.imageURL = imageURL
    }

}