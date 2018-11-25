//
//  FavoriteMovieInteractor.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 10/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import Foundation

class FavoriteMoviesInteractor: FavoriteMoviesInteractorInput {
    
    // MARK: - Properties
    var output: FavoriteMoviesInteractorOutput!
    
    // MARK: - FavoriteMoviesInteractorInput functions
    func getFavoriteMovies() {
        FavoriteMovieCoreDataManager.getFavoriteMovies { (status, movies) in
            if status == RequestStatus.success, let movies = movies {
                var hasFilter = false
                if !FavoriteMovieCoreDataManager.datesFilter.isEmpty || !FavoriteMovieCoreDataManager.genresFilter.isEmpty {
                    hasFilter = true
                }
                
                self.output.didGetFavoriteMovies(favoriteMovies: movies, hasFilter: hasFilter)
            }
        }
    }
    
    func removeFavoriteMovie(at indexPath: IndexPath) {
        // Update Popular Movies Array
        if let popularMovie = MovieDataManager.movies.first(where: { (movie) -> Bool in
            movie.id == FavoriteMovieCoreDataManager.favoriteMovies[indexPath.item].id
        }) {
            popularMovie.isFavorite = false
        }
        
        // Remove Movie from Favorites
        FavoriteMovieCoreDataManager.removeFavoriteMovie(at: indexPath) { (status) in
        }
    }
    
    func askForRemoveFilterButton() {
        if FavoriteMovieCoreDataManager.datesFilter.isEmpty && FavoriteMovieCoreDataManager.genresFilter.isEmpty {
            self.output.didAskForRemoveFilterButton(to: false)
        } else {
            self.output.didAskForRemoveFilterButton(to: true)
        }
    }
    
    func removeFilters() {
        FavoriteMovieCoreDataManager.datesFilter = []
        FavoriteMovieCoreDataManager.genresFilter = []
        self.getFavoriteMovies()
    }
}
