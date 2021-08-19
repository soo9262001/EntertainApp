//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    var id : Int = 0
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parseData()
    }

    func parseData() {
        MovieAPINetworkManager.detailMovieData(movieId: id) { result in
            
            self.titleLabel.text = result.title
            self.dateLabel.text = result.date
            self.overviewLabel.text = result.overview
            self.averageLabel.text = "\(result.average!)"
            self.voteLabel.text = "\(result.count!)"
            self.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(result.img ?? "")"))
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

