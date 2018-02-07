//
//  SettingsVC.swift
//  Surf
//
//  Created by Liming on 01/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Firebase

class SettingsVC: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "S E T T I N G S"
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return self.itemInfo
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SigninVC")
            UIApplication.shared.keyWindow?.rootViewController = viewController
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func deleteAccountAction(_ sender: Any) {
        Auth.auth().currentUser?.delete(completion: { (error) in
            if let error = error {
                print ("Error account delete: %@", error)
                return
            }
            
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SigninVC")
            UIApplication.shared.keyWindow?.rootViewController = viewController
        })
    }
    
    @IBAction func termsAction(_ sender: Any) {
        guard let url = URL(string: "http://getsurfapp.com/terms") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
