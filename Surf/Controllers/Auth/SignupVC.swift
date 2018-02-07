//
//  SignupVC.swift
//  Surf
//
//  Created by Liming on 29/11/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import PKHUD
import Firebase

class SignupVC: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var fnameTxt: UITextField!
    @IBOutlet weak var lnameText: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var cpassTxt: UITextField!
    
    var avatarImg: UIImage!
    var avatarURL: URL!
    
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
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        
        
        Auth.auth().createUser(withEmail: self.emailTxt.text!, password: self.passTxt.text!, completion: { (user, error) in

            if let error = error {
                PKHUD.sharedHUD.hide()
                
                self.showAlert(contents:error.localizedDescription)
                return
            }
            
            if self.avatarImg != nil {
                self.uploadImage()
            }
            else {
                self.saveProfile()
            }
  
        })
    }
    
    func saveProfile() {
        let profileRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        
        if self.avatarURL != nil {
            profileRequest?.photoURL = self.avatarURL
        }
        
        profileRequest?.displayName = "\(self.fnameTxt.text!) \(self.lnameText.text!)"
        
        profileRequest?.commitChanges(completion: { (error) in
            
            PKHUD.sharedHUD.hide()
            
            if let error = error {
                self.showAlert(contents:error.localizedDescription)
            }
            else {
                self.view.endEditing(true)
                self.performSegue(withIdentifier: "home_segue", sender: self)
            }
        })
    }
    
    /**
     The function for displaying the alert.
     
     - parameter contents: the contents text of alert.
     */
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
            self.avatarImg = image
            self.photoBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFill
            self.photoBtn.setImage(image, for: UIControlState.normal)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func uploadImage() {
        
        let data = UIImageJPEGRepresentation(self.avatarImg!, 0.8)! as Data as NSData
        // set upload path
        let filePath = "\(Auth.auth().currentUser!.uid)/\("userPhoto")"
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        // Create a storage reference from our storage service
        let storageRef = Storage.storage().reference()
        
        storageRef.child(filePath).putData(data as Data, metadata: metaData){(metaData,error) in
            if let error = error {
                PKHUD.sharedHUD.hide()
                self.showAlert(contents: error.localizedDescription)
                return
            }
            else{
                //store downloadURL
                self.avatarURL = metaData!.downloadURL()?.absoluteURL
            }
            
            self.saveProfile()
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
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
