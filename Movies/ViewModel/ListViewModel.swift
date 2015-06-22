//
//  ListViewModel.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import Foundation

class ListViewModel {

    var movieViewModels: [MovieViewModel]?

    func loadMovies(success: (Void -> Void), failure: (ErrorType -> Void)) {

        NetworkManager.getPopularMovies({ [weak self] movies in

            self?.movieViewModels = movies.map { movie in
                return MovieViewModel(movie: movie)
            }

            success()
            return
            }, failure: { error in
                failure(error)
                return
        })

    }

}