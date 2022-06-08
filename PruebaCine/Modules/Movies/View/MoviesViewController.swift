//
//  MoviesViewController.swift
//  PruebaCine
//
//  Created by mespinal on 5/06/22.
//

import UIKit
import MBProgressHUD

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var bottomActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bottomActivityHeightConstraint: NSLayoutConstraint!
    
    var presenter: MoviesPresenterProtocol?
    var configurator: MoviesConfiguratorProtocol?
    
    var isLoadingList = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = MoviesConfigurator()
        configurator?.configure(viewController: self)
        
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        moviesTableView.tableFooterView?.isHidden = true
        
        presenter?.getMovieList()
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let movies = presenter?.getMovies() {
            
            return movies.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = presenter?.getMovies()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        
        cell.setupCell(movie: movie)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let movie = presenter?.getMovies()[indexPath.row] {
            
            presenter?.goToDetail(movie: movie)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.presenter?.getPage() == self.presenter?.getTotalPages() {
            
            moviesTableView.tableFooterView?.isHidden = true
            
            return
        }
        
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height && !isLoadingList {
            
            isLoadingList = true
            presenter?.getMovieList()
        }
    }
}

extension MoviesViewController: MoviesViewProtocol {
    
    func showBasicAlert(title: String?, message: String?) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMovieList() {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        isLoadingList = false
        moviesTableView.reloadData()
        moviesTableView.tableFooterView?.isHidden = false
    }
}
