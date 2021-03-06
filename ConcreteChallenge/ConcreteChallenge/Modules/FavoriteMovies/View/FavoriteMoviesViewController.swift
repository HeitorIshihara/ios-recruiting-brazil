//
//  FavoriteMoviesView.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 10/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import UIKit

protocol FavoriteMoviesTableViewActions {
    func didTapMovieCell(of movie: Movie)
    func didRemoveFavoriteMovie(at indexPath: IndexPath)
    func didTapRemoveFilters()
}

class FavoriteMoviesViewController: UIViewController, FavoriteMoviesView, FavoriteMoviesTableViewActions {
    
    // MARK: - Outlets
    @IBOutlet weak var favoriteMoviesTableView: FavoriteMoviesTableView!
    
    // MARK: - Properties
    var presenter: FavoriteMoviesPresentation!
    
    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.didRequestFavoriteMovies()
        self.presenter.didAskForRemoveFilterButton()
    }
    
    // MARK: - FavoriteMoviesView Functions
    func show(favoriteMovies: [Movie]) {
        self.favoriteMoviesTableView.isHidden = false
        self.favoriteMoviesTableView.favoriteMovies = favoriteMovies
    }
    
    func showEmptyAlert() {
        self.favoriteMoviesTableView.isHidden = true
    }
    
    func setRemoveButton(to activate: Bool) {
        self.favoriteMoviesTableView.isRemoveButtonEnabled = activate
    }
    
    
    // MARK: - FavoriteMoviesTableViewActions Functions
    func didTapMovieCell(of movie: Movie) {
        self.presenter.didTapMovieCell(of: movie)
    }
    
    func didRemoveFavoriteMovie(at indexPath: IndexPath) {
        self.presenter.didRemoveFavoriteMovie(at: indexPath)
    }
    
    func didTapRemoveFilters() {
        self.presenter.didTapRemoveFiltersButton()
    }
    
    
    // MARK: - Functions
    func setupNavigationBar() {
        // Title
        self.navigationItem.title = "Movies"
        
        // Filter Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"FilterIcon"), style: .plain, target: self, action: #selector(filterButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        // Color
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.968627451, green: 0.8078431373, blue: 0.3568627451, alpha: 1)
        
    }
    
    func setupTableView() {
        self.favoriteMoviesTableView.delegate = self.favoriteMoviesTableView
        self.favoriteMoviesTableView.dataSource = self.favoriteMoviesTableView
        self.favoriteMoviesTableView.favoriteMoviesTableViewActions = self
        
        self.favoriteMoviesTableView.allowsSelection = true
    }
    
    // MARK: - Navigation Bar item Functions
    @objc func filterButtonTapped() {
        self.presenter.didTapFilterButton()
    }
}

