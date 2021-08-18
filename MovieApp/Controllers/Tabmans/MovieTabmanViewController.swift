//
//  MovieTabmanViewController.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import UIKit
import Tabman
import Pageboy

class MovieTabmanViewController: TabmanViewController {
    
    private var movieViewControllers : Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let popularVC = self.storyboard?.instantiateViewController(withIdentifier: "TopMovie") as! TopRatedMovieViewController
        let nowPlayingVC = self.storyboard?.instantiateViewController(withIdentifier: "NowMovie") as! NowPlayingMovieViewController
        
        
        movieViewControllers.append(popularVC)
        movieViewControllers.append(nowPlayingVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .progressive
        bar.backgroundView.style = .blur(style: .light)
        bar.backgroundColor = .white
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        bar.layout.interButtonSpacing = 40
        bar.layout.contentMode = .intrinsic
        bar.indicator.weight = .light
        bar.indicator.tintColor = .black
        bar.buttons.customize { button in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        
        addBar(bar, dataSource: self, at: .top)
        
    }


}

extension MovieTabmanViewController : PageboyViewControllerDataSource,TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        movieViewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return movieViewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        if index == 0 {
            item.title = "TopMovie"
        }else {
            item.title = "NowPlayingMovie"
        }
        return item
    }
    
    
}

