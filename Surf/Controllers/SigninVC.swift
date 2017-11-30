//
//  SigninVC.swift
//  Surf
//
//  Created by Liming on 29/11/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import PKHUD

class SigninVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func loginAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "home_segue", sender: self)
    }
    
    @IBAction func fbLoginAction(_ sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager.init()
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            PKHUD.sharedHUD.hide()
            if let error = error {
                PKHUD.sharedHUD.contentView = PKHUDErrorView(title: "Error", subtitle: error.localizedDescription)
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 2)
                return
            }
            
            self.performSegue(withIdentifier: "home_segue", sender: self)
        }
    }
}
