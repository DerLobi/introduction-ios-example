//
//  NetworkManager.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import Foundation

class NetworkManager {

    class func getPopularMovies(success: ([Movie] -> Void), failure: (ErrorType -> Void)) {

        let url = NSURL(string: "https://api-v2launch.trakt.tv/movies/popular?extended=full,images")!
        let request = urlRequestForURL(url)

        let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                failure(error)
                return
            }

            if let data = data {

                do {
                    let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
                    let parsedMovies = MovieParser.parseMoviesFromJSON(jsonArray)
                    success(parsedMovies)

                } catch {
                    failure(error)
                    return
                }

            }

        }
        dataTask?.resume()

    }

    private class func urlRequestForURL(url: NSURL) -> NSURLRequest {
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("2", forHTTPHeaderField: "trakt-api-version")
        request.setValue(TraktTvAPIKey, forHTTPHeaderField: "trakt-api-key")
        return request
    }

}