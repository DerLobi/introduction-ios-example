//
//  MovieParser.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import Foundation

class MovieParser {

    class func parseMoviesFromJSON(input: AnyObject) -> [Movie] {

        let jsonArray = input as! [ [String: AnyObject] ]

        var parsedMovies = [Movie]()

        for dict in jsonArray {

            if let title = dict["title"] as? String,
                let year = dict["year"] as? Int,
                let overview = dict["overview"] as? String,
                let images = dict["images"] as? [String: AnyObject],
                let posters = images["poster"] as? [String: AnyObject],
                let mediumPoster = posters["medium"] as? String,
                let mediumPosterURL = NSURL(string: mediumPoster) {
                    let movie = Movie(title: title, year: year, overview: overview, imageURL: mediumPosterURL)
                    parsedMovies.append(movie)
            }

        }

        return parsedMovies
    }

}