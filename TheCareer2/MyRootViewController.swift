//
//  MyRootViewController.swift
//  TheCareer2
//
//  Created by baihai on 15/2/5.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class MyRootViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Only one section.
        return 2
    }*/

    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // In this one section
        //return _menuEntries.count
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as MenuViewCell
        let row = indexPath.row
        cell.label.text = _menuEntries[row]
        return cell
    }*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    @IBAction func onDoSomethingDone(segue:UIStoryboardSegue){
        println("On something done")
//        _counter++
//        if _counter < 3 {
//            let aView = UIAlertView(title:"Not enough", message:"Yes", delegate:nil, cancelButtonTitle:"Cancel")
//            aView.show()
//        } else {
//            //dismissViewControllerAnimated(true, completion:nil)
//        }
        
        //whether dismissViewControllerAnimated is called,
        // is completely irrellevent.
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func onAboutDone(segue:UIStoryboardSegue){
        println("About is finished")
    }

    //////
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject? ){
        //There is no more MenuViewCell.
        /*
        if let titleOne = sender as? MenuViewCell {
            if let index = find(_menuEntries, titleOne.label!.text!) {
                println("OK, traslate to \(index)")
                println("namely : \(_menuEntries[index])")
            }
        }*/
    }
}
