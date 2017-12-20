//
//  PhotoVC.swift
//  Surf
//
//  Created by Liming on 11/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pager.numberOfPages = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pagerControllerChanged(_ sender: UIPageControl) {
        let pageWidth = self.collectionView.bounds.width
        
        let scrollX = pageWidth * CGFloat(self.pager.currentPage)
        let scrollTo = CGPoint.init(x: scrollX, y: 0)
        
        self.collectionView.setContentOffset(scrollTo, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.bounds.size.width, height: self.collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.collectionView.bounds.width
        self.pager.currentPage = Int(self.collectionView.contentOffset.x / pageWidth)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        // If you want to put an image
        let image : UIImage = #imageLiteral(resourceName: "dummy_photo2")
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [image], applicationActivities: nil)
        
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
    
    
    @IBAction func backAction(_ sender: Any) {
        if self.pager.currentPage > 0 {
            self.pager.currentPage = self.pager.currentPage - 1
            self.pagerControllerChanged(self.pager)
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if self.pager.currentPage < 4 {
            self.pager.currentPage = self.pager.currentPage + 1
            self.pagerControllerChanged(self.pager)
        }
    }
}
