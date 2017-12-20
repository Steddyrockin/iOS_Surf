//
//  ChannelsVC.swift
//  Surf
//
//  Created by Liming on 30/11/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChannelsVC: ButtonBarPagerTabStripViewController {

    var isReload = false
    
    override func viewDidLoad() {
        self.settings.style.buttonBarHeight = 30
        self.settings.style.buttonBarTop = 40
        self.settings.style.selectedBarHeight = 3
        self.settings.style.selectedBarBackgroundColor = UIColor.white
        self.settings.style.buttonBarBackgroundColor = UIColor.clear
        self.settings.style.buttonBarItemBackgroundColor = UIColor.clear
        self.settings.style.buttonBarMinimumInteritemSpacing = 0
        self.settings.style.buttonBarItemTitleColor = UIColor.white
        self.settings.style.buttonBarItemFont = UIFont.init(name: "Brandon Grotesque", size: 8)!
        
        super.viewDidLoad()
        
        self.buttonBarView.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func searchAction(_ sender: UIButton) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
        searchVC?.modalPresentationStyle = .overCurrentContext
        self.present(searchVC!, animated: true, completion: nil)
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
        let child_0 = self.storyboard?.instantiateViewController(withIdentifier: "ArtistsVC") as! ArtistsVC
        child_0.type = 0
        
        let child_1 = self.storyboard?.instantiateViewController(withIdentifier: "ArtistsVC") as! ArtistsVC
        child_1.type = 1
        
        let child_2 = self.storyboard?.instantiateViewController(withIdentifier: "ArtistsVC") as! ArtistsVC
        child_2.type = 2
        
        guard isReload else {
            return [child_0, child_1, child_2]
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
        return Array(childViewControllers.prefix(Int(nItems))) as [UIViewController]
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
