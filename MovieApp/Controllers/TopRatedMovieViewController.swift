//
//  TopRatedMovieViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit
import Kingfisher

class TopRatedMovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var TopRatedMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getMovie()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
    }
    
    func getMovie() {
        MovieAPINetworkManager.MovieDatas(source: .toprated) { results in
            self.TopRatedMovies = results
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableView.indexPathForSelectedRow
        let detailVC = segue.destination as! MovieDetailViewController
        detailVC.id = TopRatedMovies[index!.row].id
    }
}

extension TopRatedMovieViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TopRatedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topMovie = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = TopRatedMovies[indexPath.row]
        
        topMovie.titleLabel.text = movie.title
        topMovie.dateLabel.text = movie.date
        topMovie.averageLabel.text = "\(movie.average!)"
        topMovie.voteLabel.text = "\(movie.count!)"
        topMovie.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.img ?? "")"))
        
        return topMovie
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "toDetail", sender: nil)

    }
    
}
