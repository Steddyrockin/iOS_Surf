//
//  ChannelDetailVC.swift
//  Surf
//
//  Created by Liming on 21/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChannelDetailVC: ButtonBarPagerTabStripViewController, UITabBarControllerDelegate {

    var isReload = false
    var fromIndex : Int = 0
    
    override func viewDidLoad() {
        
        self.settings.style.buttonBarHeight = 30
        self.settings.style.buttonBarTop = 261
        self.settings.style.selectedBarHeight = 3
        self.settings.style.selectedBarBackgroundColor = UIColor.white
        self.settings.style.buttonBarBackgroundColor = UIColor.clear
        self.settings.style.buttonBarItemBackgroundColor = UIColor.clear
        self.settings.style.buttonBarMinimumInteritemSpacing = 0
        self.settings.style.buttonBarItemTitleColor = UIColor.white
        self.settings.style.buttonBarItemFont = UIFont.init(name: "Brandon Grotesque", size: 8)!
        
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        
        self.buttonBarView.backgroundColor = UIColor.clear
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(respondToRightSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(respondToLeftSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        self.view.alpha = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.view.alpha = 1.0
        }, completion: nil)
    }
    
    @objc func respondToRightSwipeGesture(_ sender: UITapGestureRecognizer) {
        
        self.closeController(direction: true)
    }
    
    @objc func respondToLeftSwipeGesture(_ sender: UITapGestureRecognizer) {
        
        self.closeController(direction: false)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        
        self.closeController(direction: false)
    }
    
    
    func closeController(direction: Bool) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        
        if direction {
            transition.subtype = kCATransitionFromRight
        }
        else {
            transition.subtype = kCATransitionFromLeft
        }
        
        self.view.window!.layer.add(transition, forKey: nil)
        
        let channelsVC = self.storyboard?.instantiateViewController(withIdentifier: "ChannelsVC") as! ChannelsVC
        var vcs = self.tabBarController?.childViewControllers
        
        vcs![3] = channelsVC
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 3
        
        channelsVC.moveToViewController(at: self.fromIndex)
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
        searchVC?.modalPresentationStyle = .overCurrentContext
        self.present(searchVC!, animated: true, completion: nil)
    }

    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_0 = self.storyboard?.instantiateViewController(withIdentifier: "BioBarVC")
        let child_1 = self.storyboard?.instantiateViewController(withIdentifier: "VideosBarVC")
        let child_2 = self.storyboard?.instantiateViewController(withIdentifier: "PhotosBarVC")
        let child_3 = self.storyboard?.instantiateViewController(withIdentifier: "StoriesBarVC")
        
        guard isReload else {
            return [child_0!, child_1!, child_2!, child_3!]
        }
        
        var childViewControllers = [child_0, child_1, child_2, child_3!]
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let channelsVC = self.storyboard?.instantiateViewController(withIdentifier: "ChannelsVC") as! ChannelsVC
        var vcs = self.tabBarController?.childViewControllers
        
        vcs![3] = channelsVC
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 3
        
        //channelsVC.moveToViewController(at: self.fromIndex)
    }

}
