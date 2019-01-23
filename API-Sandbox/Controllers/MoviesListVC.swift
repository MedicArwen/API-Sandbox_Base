//
//  MoviesListVC.swift
//  API-Sandbox
//
//  Created by etudiant-16 on 23/01/2019.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MoviesListVC: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet weak var moviesListTableView: UITableView!
    // MARK: - VARIABLES
    var moviesList = [Movie]()
    
    // MARK: - VIEWS FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        moviesListTableView.delegate = self
        moviesListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func getData()
    {
        let apiToContact = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        Alamofire.request(apiToContact).validate().responseJSON{(response) in
            switch response.result{
            case .success:
                if let value = response.result.value{
                    let json = JSON(value)
                    let moviesData = json["feed"]["entry"].arrayValue
                    for movie in moviesData
                    {
                        self.moviesList.append(Movie(json: movie))
                    }
                    self.moviesListTableView.reloadSections([0], with: .automatic)
                }
            default: break
        }
        }}
    
    // MARK: - PREPARATION SEGUES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"
        {
            let row = moviesListTableView.indexPathForSelectedRow?.row
            let destinationVC = segue.destination as! DetailVC
            destinationVC.movie = self.moviesList[row!]
        }
    }

}

extension MoviesListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesListTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as!MovieCell
        cell.configCell(with: moviesList[indexPath.row])
        return cell
    }
    // Action click sur cellulle
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
        moviesListTableView.deselectRow(at: indexPath, animated: false)
    }
    
}
