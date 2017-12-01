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

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldEditBegin(_ sender: UITextField) {
        if sender == self.emailTxt {
            
            if sender.text == "Email" {
                sender.text = ""
            }
            
        }
        else {
            
            if sender.text == "Password" {
                sender.text = ""
                sender.isSecureTextEntry = true
            }
            
        }
    }
    
    @IBAction func textFieldEditEnd(_ sender: UITextField) {
        if sender == self.emailTxt {
            
            if sender.text == "" {
                sender.text = "Email"
            }
        }
        else {
            
            if sender.text == "" {
                sender.text = "Password"
                sender.isSecureTextEntry = false
            }
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

    @IBAction func loginAction(_ sender: UIButton) {
        
        if self.emailTxt.text == "Email" {
            self.showAlert(contents: "Please input the email address.")
            return
        }
        
        if self.passTxt.text == "Password" {
            self.showAlert(contents: "Please input the password.")
            return
        }
        
        self.performSegue(withIdentifier: "home_segue", sender: self)
    }
    
    @IBAction func fbLoginAction(_ sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager.init()
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            PKHUD.sharedHUD.hide()
            if let error = error {
                
                self.showAlert(contents: error.localizedDescription)
                return
            }
            
            self.performSegue(withIdentifier: "home_segue", sender: self)
        }
    }
    
    func showAlert(contents : String) {
        PKHUD.sharedHUD.contentView = PKHUDErrorView(title: nil, subtitle: contents)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2)
    }
}
