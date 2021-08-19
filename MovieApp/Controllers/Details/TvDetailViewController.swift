//
//  TvDetailViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit
import Kingfisher

class TvDetailViewController: UIViewController {
    
    var id : Int = 0

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print(id)
        parseData()
    }

    func parseData() {
        TvAPINetworkManager.detailTvDatas(tvId: id) { result in
            print(result)
            self.nameLabel.text = result.name
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
