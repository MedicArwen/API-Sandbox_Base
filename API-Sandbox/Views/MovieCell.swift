//
//  MovieCell.swift
//  API-Sandbox
//
//  Created by etudiant-16 on 23/01/2019.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(with movie:Movie)
    {
        self.titleLabel.text = movie.name
        self.priceLabel.text = "$\(movie.price)"
        self.posterMovie.af_setImage(withURL: URL(string: movie.posterImageURL)!)
    }

}
