//
//  FavoriteMoviesRouter.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 10/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import UIKit

class FavoriteMoviesRouter: FavoriteMoviesWireframe {
    
    weak var viewController: UIViewController?
    static var presenter: FavoriteMoviesPresentation!
    
    static func assembleModule() -> UIViewController {
        let presenter = FavoriteMoviesPresenter()
        let interactor = FavoriteMoviesInteractor()
        let router = FavoriteMoviesRouter()
        
        let storyboard = UIStoryboard(name: "FavoriteMovies", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoriteMovies")
        
        if let FavoriteMoviesViewController = viewController as? FavoriteMoviesViewController {
            FavoriteMoviesViewController.presenter = presenter
            presenter.view = FavoriteMoviesViewController
            router.viewController = FavoriteMoviesViewController
        }
        
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        self.presenter = presenter
        
        return viewController
    }
}