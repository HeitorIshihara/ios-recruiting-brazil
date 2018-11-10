//
//  FavoriteMoviesPresenter.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 10/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import Foundation

class FavoriteMoviesPresenter: FavoriteMoviesPresentation, FavoriteMoviesInteractorOutput {
    
    // MARK: - Properties
    var view: FavoriteMoviesView?
    var interactor: FavoriteMoviesInteractorInput!
    var router: FavoriteMoviesWireframe!
    
    // MARK: - FavoriteMoviesPresentation functions
    func viewDidLoad() {
    }
    
    // MARK: - FavoriteMoviesInteractorOutput functions
    
}