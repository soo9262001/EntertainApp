//
//  PopularTvViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit
import Kingfisher

class PopularTvViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var PopularTvs = [Tv]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        getTv()
        collectionView.register(UINib(nibName: "TvCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tvCell")
    }
    
    func getTv() {
        TvAPINetworkManager.TvDatas(source: .popular) { results in
            //print(results)
            self.PopularTvs = results
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
                if let detailVC = segue.destination as? TvDetailViewController {
                    if let paths = collectionView?.indexPathsForSelectedItems {
                        let row = paths[0].row
                        detailVC.id = PopularTvs[row].id
                    }
                }
            }
        
//        if segue.identifier == "toDetail" {
//            let tv = PopularTvs[Index]
//                let IndexPath = sender as? NSIndexPath
//                let detailVC = segue.destination as! TvDetailViewController
//            detailVC.id = PopularTvs[IndexPath.row] as String
//            }

    }

}

extension PopularTvViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PopularTvs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvCell", for: indexPath) as! TvCollectionViewCell
        
        cell.backgroundColor = .white
        
        let tv = PopularTvs[indexPath.row]
        
        cell.nameLabel.text = tv.name
        cell.dateLabel.text = tv.date
        cell.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(tv.img ?? "")"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
}

extension PopularTvViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 2
        let size = CGSize(width: width, height: width)
        return size
    }
}
