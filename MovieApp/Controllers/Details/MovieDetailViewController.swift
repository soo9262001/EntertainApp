//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var id : Int = 0
    
    @IBOutlet weak var idLabel: UILabel!
    
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
            self.idLabel!.text = result.title
        }
    }
}

