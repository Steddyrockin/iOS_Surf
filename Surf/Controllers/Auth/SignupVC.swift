//
//  SignupVC.swift
//  Surf
//
//  Created by Liming on 29/11/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import PKHUD

class SignupVC: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var fnameTxt: UITextField!
    @IBOutlet weak var lnameText: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var cpassTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldEditBegin(_ sender: UITextField) {
        
        if sender == self.fnameTxt {
            
            if sender.text == "First Name" {
                sender.text = ""
            }
            
            return
        }
        
        if sender == self.lnameText {
            
            if sender.text == "Last Name" {
                sender.text = ""
            }
            
            return
        }
        
        if sender == self.emailTxt {
            
            if sender.text == "Email" {
                sender.text = ""
            }
            
            return
        }
            
        if sender == self.passTxt {
            
            if sender.text == "Password" {
                sender.text = ""
                sender.isSecureTextEntry = true
            }
            
            return
        }
        
        if sender == self.cpassTxt {
            
            if sender.text == "Confirm Password" {
                sender.text = ""
                sender.isSecureTextEntry = true
            }
            
            return
        }
    }
    
    @IBAction func textFieldEditEnd(_ sender: UITextField) {
        
        if sender == self.fnameTxt {
            
            if sender.text == "" {
                sender.text = "First Name"
            }
            
            return
        }
        
        if sender == self.lnameText {
            
            if sender.text == "" {
                sender.text = "Last Name"
            }
            
            return
        }
        
        if sender == self.emailTxt {
            
            if sender.text == "" {
                sender.text = "Email"
            }
            
            return
        }
        
        if sender == self.passTxt {
            
            if sender.text == "" {
                sender.text = "Password"
                sender.isSecureTextEntry = false
            }
            
            return
        }
        
        if sender == self.cpassTxt {
            
            if sender.text == "" {
                sender.text = "Confirm Password"
                sender.isSecureTextEntry = false
            }
            
            return
        }
    }

    @IBAction func loadPhotoAction(_ sender: UIButton) {
        
        self.openLibrary()
    }
    
    @IBAction func signupAction(_ sender: Any) {
        
        if self.fnameTxt.text == "First Name" {
            self.showAlert(contents: "Please input the first name.")
            return
        }
        
        if self.passTxt.text == "Last Name" {
            self.showAlert(contents: "Please input the last name.")
            return
        }
        
        if self.emailTxt.text == "Email" {
            self.showAlert(contents: "Please input the email address.")
            return
        }
        
        if self.passTxt.text == "Password" {
            self.showAlert(contents: "Please input the password.")
            return
        }
        
        if self.passTxt.text != self.cpassTxt.text {
            self.showAlert(contents: "Please confirm the password.")
            return
        }
        
        self.performSegue(withIdentifier: "home_segue", sender: self)
    }
    
    func showAlert(contents : String) {
        PKHUD.sharedHUD.contentView = PKHUDErrorView(title: nil, subtitle: contents)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: 2)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //save image
            //display image
            self.photoBtn.setImage(image, for: UIControlState.normal)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
