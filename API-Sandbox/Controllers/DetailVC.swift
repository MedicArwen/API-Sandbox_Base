//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class DetailVC: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rightsOwnerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        exerciseOne()
//        exerciseTwo()
//        exerciseThree()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let movie = movie else {return}
        movieTitleLabel.text = movie.name
        rightsOwnerLabel.text = movie.rightsOwner
        releaseDateLabel.text = movie.releaseDate
        priceLabel.text = "\(String(describing: movie.price))"
        loadPoster(urlString: movie.posterImageURL)
    }
    
    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        posterImageView.af_setImage(withURL: URL(string: urlString)!)
    }
    
    @IBAction func viewOniTunesPressed(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: movie!.link)!, options: [:], completionHandler: nil)
    }
    
}

