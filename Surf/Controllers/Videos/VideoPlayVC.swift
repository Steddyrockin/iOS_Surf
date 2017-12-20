//
//  VideoPlayVC.swift
//  Surf
//
//  Created by Liming on 09/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit

class VideoPlayVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var commentTxt: UITextField!
    var fromIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Global.sharedInstance.videoPlayed = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func respondToSwipeGesture(_ sender: UITapGestureRecognizer) {
        
        self.closeController()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.closeController()
    }
    
    func closeController() {
        let videoVC = self.storyboard?.instantiateViewController(withIdentifier: "VideosVC") as! VideosVC
        var vcs = self.tabBarController?.childViewControllers
        
        vcs![1] = videoVC
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 1
        
        videoVC.moveToViewController(at: self.fromIndex)
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
        searchVC?.modalPresentationStyle = .overCurrentContext
        self.present(searchVC!, animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        let firstActivityItem = "Surf App"
        let secondActivityItem : NSURL = NSURL(string: "http://youtube.com")!
        // If you want to put an image
        let image : UIImage = #imageLiteral(resourceName: "logo")
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
        
        // This lines is for the popover you need to show in iPad
        activityViewController.popoverPresentationController?.sourceView = sender
        
        // This line remove the arrow of the popover to show in iPad
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.left
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
        
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivityType.postToWeibo,
            UIActivityType.print,
            UIActivityType.assignToContact,
            UIActivityType.saveToCameraRoll,
            UIActivityType.addToReadingList,
            UIActivityType.postToFlickr,
            UIActivityType.postToVimeo,
            UIActivityType.postToTencentWeibo,
            UIActivityType.postToTwitter,
            UIActivityType.postToFacebook
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func spotifyAction(_ sender: UIButton) {
    }
    
    @IBAction func textFieldEditBegin(_ sender: UITextField) {
   
        if sender.text == "Write a comment..." {
            sender.text = ""
        }
    }
    
    @IBAction func textFieldEditEnd(_ sender: UITextField) {
      
        if sender.text == "" {
            sender.text = "Write a comment..."
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

    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
}
