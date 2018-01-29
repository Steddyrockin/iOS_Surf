//
//  HomeVC.swift
//  Surf
//
//  Created by Liming on 30/11/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import Contentful

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITabBarControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var likeBtn: UIButton!
    
    let client = Client(spaceId: Global.CONTENTFUL_ID, accessToken: Global.CONTENTFUL_TOKEN)
    
    var homeEvent: Event! = nil
    var homeGallery: Gallery! = nil
    var homeStory: Story! = nil
    var homeChannel: Channel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.clipsToBounds = true
        self.collectionView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
        
        self.loadContentsOfHome()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Global.sharedInstance.preIndex = 0
    }
    
    func loadContentsOfHome() {
        let query = Query(where: "content_type", .equals("home"))
        
        self.client.fetchEntries(with: query) { (result) in
            switch result {
                case .success(let entriesArrayResponse):
                    let contents = entriesArrayResponse.items
                
                    let homeEntry = contents.first
                    let arrayOfIDs = homeEntry?.fields["homePage"] as! [Link]
                    
                    var type = 0
                    let dispatchGroup = DispatchGroup()

                    for mLink in arrayOfIDs {
                        dispatchGroup.enter()
                        self.loadEntry(with: mLink.id, type: type, withCompletionHandler: {
                            dispatchGroup.leave()
                        })

                        type += 1
                    }
                
                    dispatchGroup.notify(queue: DispatchQueue.main) {
                        // Do stuff with home entries.
                        self.collectionView.reloadData()
                    }
                
                case .error(let error):
                    print("Oh no something went wrong: \(error)")
            }
        }
    }
    
    func loadEntry(with eventID: String, type: Int, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.client.fetchEntry(id: eventID, completion: { (result) in
            switch result {
                case .success(let entry):
                    if type == 0 {
                        self.homeEvent = Event(entry : entry)
                    }
                    
                    if type == 1 {
                        self.homeChannel = Channel(entry : entry)
                    }
                    
                    if type == 2 {
                        self.homeStory = Story(entry : entry)
                    }
                    
                    if type == 3 {
                        self.homeGallery = Gallery(entry : entry)
                    }
                
                case .error(let error):
                    print("Oh no something went wrong: \(error)")
            }
            
            completionHandler()
        })
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellId = ""
        
        switch indexPath.row {
            case 0:
                cellId = "eventCell"
                break
            case 1:
                cellId = "channelCell"
                break
            case 2:
                cellId = "storyCell"
                break
            case 3:
                cellId = "galleryCell"
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
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var vcs = self.tabBarController?.childViewControllers
        
        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryVC")
        storyVC?.tabBarItem = vcs![2].tabBarItem
        vcs![2] = storyVC!
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 2
    }

    @IBAction func searchAction(_ sender: UIButton) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
        searchVC?.modalPresentationStyle = .overCurrentContext
        self.present(searchVC!, animated: true, completion: nil)
    }
    
    @IBAction func likeAction(_ sender: UIButton) {
        
    }
}
