//
//  DetailMovieViewController.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movieViewModel: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }

}

extension DetailMovieViewController {
    
    func setUp() {
        
        titleLabel.text = movieViewModel?.title
        voteAverageLabel.text = "\((movieViewModel?.voteAverage)!)"
        releaseDateLabel.text = movieViewModel?.releaseDate
        overviewLabel.text = movieViewModel?.overview
        
        if let url = URL(string: (movieViewModel?.poster)!) {
            
            movieImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
        }
    }
}
