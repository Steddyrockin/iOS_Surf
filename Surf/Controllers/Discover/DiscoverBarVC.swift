//
//  DiscoverBarVC.swift
//  Surf
//
//  Created by Liming on 02/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class DiscoverBarVC: UITableViewController, IndicatorInfoProvider  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.backgroundColor = .clear
        
//        let gradientLayer = CALayer()
//        gradientLayer.contents = UIImage.init(named: "mask")?.cgImage
//        gradientLayer.frame = self.view.bounds
//        
//        self.view.layer.mask = gradientLayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.row == 0 {
            let discoverCell = tableView.dequeueReusableCell(withIdentifier: "discoverCell0", for: indexPath) as! DiscoverCell
            discoverCell.presentCtrl = self
            
            cell = discoverCell
        }
        
        if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "discoverCell1", for: indexPath)
        }
        
        if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "discoverCell2", for: indexPath)
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 355
        }
        
        else if indexPath.row == 1 {
            return 182
        }
        
        else {
            return 172
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoVC")
            photoVC?.modalPresentationStyle = .overCurrentContext
            self.present(photoVC!, animated: true, completion: nil)
        }
            
        else  {
            var vcs = self.tabBarController?.childViewControllers
            
            let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryVC")
            storyVC?.tabBarItem = vcs![2].tabBarItem
            vcs![2] = storyVC!
            
            self.tabBarController?.setViewControllers(vcs, animated: false)
            self.tabBarController?.selectedIndex = 2
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "D I S C O V E R"
    }
}
