//
//  VideosVC.swift
//  Surf
//
//  Created by Liming on 30/11/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class VideosVC: ButtonBarPagerTabStripViewController {
    
    var isReload = false
    
    override func viewDidLoad() {
        
        self.settings.style.buttonBarHeight = 30
        self.settings.style.buttonBarTop = 60
        self.settings.style.selectedBarHeight = 3
        self.settings.style.selectedBarBackgroundColor = UIColor.white
        self.settings.style.buttonBarBackgroundColor = UIColor.clear
        self.settings.style.buttonBarItemBackgroundColor = UIColor.clear
        self.settings.style.buttonBarMinimumInteritemSpacing = 0
        self.settings.style.buttonBarItemTitleColor = UIColor.white
        self.settings.style.buttonBarItemFont = UIFont.init(name: "Brandon Grotesque", size: 8)!
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.buttonBarView.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_0 = self.storyboard?.instantiateViewController(withIdentifier: "FeaturedBarVC")
        let child_1 = self.storyboard?.instantiateViewController(withIdentifier: "LiveBarVC")
        let child_2 = self.storyboard?.instantiateViewController(withIdentifier: "ReleaseBarVC")
        
        guard isReload else {
            return [child_0!, child_1!, child_2!]
        }
        
        var childViewControllers = [child_0, child_1, child_2]
        
        for index in childViewControllers.indices {
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index {
                childViewControllers.swapAt(index, n)
            }
        }
        let nItems = 1 + (arc4random() % 8)
        return Array(childViewControllers.prefix(Int(nItems))) as! [UIViewController]
    }
    
    override func reloadPagerTabStripView() {
        isReload = true
        if arc4random() % 2 == 0 {
            pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0, elasticIndicatorLimit: arc4random() % 2 == 0 )
        } else {
            pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
        }
        super.reloadPagerTabStripView()
    }

}
