//
//  StoryBarVC.swift
//  Surf
//
//  Created by Liming on 02/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class StoryBarVC: UIViewController, IndicatorInfoProvider, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // self.collectionView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
        let gradientLayer = CALayer()
        gradientLayer.contents = UIImage.init(named: "mask")?.cgImage
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.mask = gradientLayer
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = "storyCell"
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.size.width, height: self.collectionView.bounds.size.height)
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var vcs = self.tabBarController?.childViewControllers
        
        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryVC")
        storyVC?.tabBarItem = vcs![2].tabBarItem
        vcs![2] = storyVC!
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 2
    }

    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "S T O R I E S"
    }
}
