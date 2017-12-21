//
//  SeriesChannelVC.swift
//  Surf
//
//  Created by Liming on 21/12/2017.
//  Copyright © 2017 surf. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SeriesChannelVC: UITableViewController, IndicatorInfoProvider  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 8
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell0", for: indexPath)
        }
        
        if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell1", for: indexPath)
        }
        
        if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell2", for: indexPath)
        }
        
        if indexPath.row == 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell3", for: indexPath)
        }
        
        if indexPath.row == 4 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell4", for: indexPath)
        }
        
        if indexPath.row == 5 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell5", for: indexPath)
        }
        
        if indexPath.row == 6 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell6", for: indexPath)
        }
        
        if indexPath.row == 7 {
            cell = tableView.dequeueReusableCell(withIdentifier: "channelCell7", for: indexPath)
        }
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vcs = self.tabBarController?.childViewControllers
        
        let channelVC = self.storyboard?.instantiateViewController(withIdentifier: "ChannelDetailVC") as! ChannelDetailVC
        channelVC.fromIndex = 2
        channelVC.tabBarItem = vcs![3].tabBarItem
        vcs![3] = channelVC
        
        self.tabBarController?.setViewControllers(vcs, animated: false)
        self.tabBarController?.selectedIndex = 3
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        return "S E R I E S"
    }
}
