//
//  MoviesViewController.swift
//  PruebaCine
//
//  Created by mespinal on 5/06/22.
//

import UIKit

class MoviesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToDetail(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailMovieViewController")
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
