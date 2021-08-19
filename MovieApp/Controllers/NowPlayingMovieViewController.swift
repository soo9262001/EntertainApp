//
//  NowPlayingMovieViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit

class NowPlayingMovieViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    private var NowPlayingMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        getMovie()
        tableVIew.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
    }
    
    func getMovie() {
        MovieAPINetworkManager.MovieDatas(source : .nowplaying) { results in
            self.NowPlayingMovies = results
            OperationQueue.main.addOperation {
                self.tableVIew.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = self.tableVIew.indexPathForSelectedRow
        let detailVC = segue.destination as! MovieDetailViewController
        detailVC.id = NowPlayingMovies[index!.row].id
    }

}

extension NowPlayingMovieViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NowPlayingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nowMovie = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = NowPlayingMovies[indexPath.row]
        
        nowMovie.titleLabel.text = movie.title
        nowMovie.dateLabel.text = movie.date
        nowMovie.averageLabel.text = "\(movie.average!)"
        nowMovie.voteLabel.text = "\(movie.count!)"
        nowMovie.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.img ?? "")"))
        
        return nowMovie
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "toDetail", sender: nil)

    }
    
}
