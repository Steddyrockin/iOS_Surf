//
//  TutorialVC.swift
//  Surf
//
//  Created by Liming on 21/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pager.numberOfPages = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func skipAction(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellId = ""
        
        switch indexPath.row {
            case 0:
                cellId = "tutorialCell0"
                break
            case 1:
                cellId = "tutorialCell1"
                break
            case 2:
                cellId = "tutorialCell2"
                break
            case 3:
                cellId = "tutorialCell3"
                break
            case 4:
                cellId = "tutorialCell4"
                break
            default:
                break
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.bounds.size.width, height: self.collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    @IBAction func pagerControllerChanged(_ sender: UIPageControl) {
        let pageWidth = self.collectionView.bounds.width
        
        let scrollX = pageWidth * CGFloat(self.pager.currentPage)
        let scrollTo = CGPoint.init(x: scrollX, y: 0)
        
        self.collectionView.setContentOffset(scrollTo, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.collectionView.bounds.width
        self.pager.currentPage = Int(self.collectionView.contentOffset.x / pageWidth)
    }
}
