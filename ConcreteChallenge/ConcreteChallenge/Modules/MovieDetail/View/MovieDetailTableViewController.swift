//
//  MovieDetailTableViewController.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 15/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import UIKit

class MovieDetailTableViewController: UITableViewController, MovieDetailView {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieGenres: UILabel!
    @IBOutlet weak var movieOverview: UITextView!

    // MARK: - Properties
    var presenter: MovieDetailPresentation!
    
    // MARK: - Life cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    // MARK: - MovieDetailView Functions
    func showDetails(of movie: MovieDetails) {
        DispatchQueue.main.async {
            // Image
            self.posterImage.image = movie.posterImage
            
            // Title
            self.movieTitle.text = movie.title
            
            // Release Year
            let calendar = Calendar.current
            let components = calendar.dateComponents([Calendar.Component.year], from: movie.releaseDate)
            if let year = components.year {
                self.movieReleaseYear.text = String(describing: year)
            } else {
                self.movieReleaseYear.text = "Unavailable"
            }
            
            // Genres
            var genres = ""
            for (index, genre) in movie.genres.enumerated() {
                genres.append(genre)
                if index != movie.genres.count - 1 {
                    genres.append(", ")
                }
            }
            self.movieGenres.text = genres
            
            
            // Overview
            self.movieOverview.text = movie.overview
            self.movieOverview.textContainer.lineFragmentPadding = 0

            // Update Cells Height
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 480
        case 4:
            let overViewTextViewWitdh = self.movieOverview.frame.size.width
            let cellSize = movieOverview.sizeThatFits(CGSize(width: overViewTextViewWitdh, height: CGFloat.greatestFiniteMagnitude))
            
            return cellSize.height + 10
        default:
            return 50
        }
    }
    
    // MARK: - Functions
    
}
