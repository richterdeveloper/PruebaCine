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
        
        // Average Rate
        let averageRateTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let averageRateAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 12.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let averageRateTitleAttString = NSAttributedString(string: "Puntuación: ", attributes: averageRateTitleAttribute)
        
        let averageRateAttString = NSAttributedString(string: "\((movieViewModel?.voteAverage)!)", attributes: averageRateAttribute)
        
        let averageRateFullAttString = NSMutableAttributedString()
        averageRateFullAttString.append(averageRateTitleAttString)
        averageRateFullAttString.append(averageRateAttString)
        
        // ReleaseDate
        let releaseDateTitleAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 12.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let releaseDateAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 12.0)!,
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let releaseDateTitleAttString = NSAttributedString(string: "Estreno: ", attributes: releaseDateTitleAttribute)
        
        let releaseDateAttString = NSAttributedString(string: "\((movieViewModel?.voteAverage)!)", attributes: releaseDateAttribute)
        
        let releaseDateFullAttString = NSMutableAttributedString()
        releaseDateFullAttString.append(releaseDateTitleAttString)
        releaseDateFullAttString.append(releaseDateAttString)
        
        
        titleLabel.text = movieViewModel?.title
        voteAverageLabel.attributedText = averageRateFullAttString
        releaseDateLabel.attributedText = releaseDateFullAttString
        overviewLabel.text = movieViewModel?.overview
        
        if let url = URL(string: (movieViewModel?.poster)!) {
            
            movieImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
        }
    }
}
