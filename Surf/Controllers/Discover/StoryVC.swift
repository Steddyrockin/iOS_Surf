//
//  StoryVC.swift
//  Surf
//
//  Created by Liming on 11/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit

class StoryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentPage : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    @objc func respondToSwipeGesture(_ sender: UITapGestureRecognizer) {
        
        self.closeController()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.closeController()
    }
    
    func closeController() {
        let discoverVC = self.storyboard?.instantiateViewController(withIdentifier: "DiscoverVC") as! DiscoverVC
        
        var vcs = self.tabBarController?.childViewControllers
        
        vcs![2] = discoverVC
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 2
        
        discoverVC.moveToViewController(at: 2)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.collectionView.bounds.width
        self.currentPage = Int(self.collectionView.contentOffset.x / pageWidth)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pagerControllerChanged() {
        let pageWidth = self.collectionView.bounds.width
        
        let scrollX = pageWidth * CGFloat(self.currentPage)
        let scrollTo = CGPoint.init(x: scrollX, y: 0)
        
        self.collectionView.setContentOffset(scrollTo, animated: true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        if self.currentPage > 0 {
            self.currentPage = self.currentPage - 1
            self.pagerControllerChanged()
        }
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        if self.currentPage < 4 {
            self.currentPage = self.currentPage + 1
            self.pagerControllerChanged()
        }
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        
    }
    
}
