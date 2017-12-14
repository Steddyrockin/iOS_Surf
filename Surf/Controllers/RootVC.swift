//
//  RootVC.swift
//  Surf
//
//  Created by Liming on 09/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit

class RootVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
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

    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item")
        
        if self.selectedIndex == 1 {
            let videoVC = self.storyboard?.instantiateViewController(withIdentifier: "VideosVC")
            var vcs = self.childViewControllers
            
            vcs[1] = videoVC!
            
            self.setViewControllers(vcs, animated: false)
            self.selectedIndex = 1
            
            return
        }
        
        if self.selectedIndex == 2 {
            //self.viewControllers![1] = (self.storyboard?.instantiateViewController(withIdentifier: "VideosVC"))!
            let discoverVC = self.storyboard?.instantiateViewController(withIdentifier: "DiscoverVC")
            var vcs = self.childViewControllers
            
            vcs[2] = discoverVC!
            
            self.setViewControllers(vcs, animated: false)
            self.selectedIndex = 2
            
            return
        }
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
