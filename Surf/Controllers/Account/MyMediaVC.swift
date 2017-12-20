//
//  MyMediaVC.swift
//  Surf
//
//  Created by Liming on 01/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyMediaVC: UITableViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.backgroundColor = .clear
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
        
        var cell_id = "media_cell0"
        
        switch indexPath.row {
            case 0:
                cell_id = "media_cell0"
                break
            case 1:
                cell_id = "media_cell1"
                break
            case 2:
                cell_id = "media_cell2"
                break
            default:
                break
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_id, for: indexPath)

        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            var vcs = self.tabBarController?.childViewControllers
            
            let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayVC")
            playerVC?.tabBarItem = vcs![1].tabBarItem
            vcs![1] = playerVC!
            
            self.tabBarController?.setViewControllers(vcs, animated: false)
            self.tabBarController?.selectedIndex = 1
        }
            
        else if indexPath.row == 1 {
            let photoVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoVC")
            photoVC?.modalPresentationStyle = .overCurrentContext
            self.present(photoVC!, animated: true, completion: nil)
        }
            
        else {
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
        return "M Y  M E D I A"
    }
}
