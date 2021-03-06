//
//  OfficeWorkViewController.swift
//  TheCareer2
//
//  Created by baihai on 15/2/6.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class OfficeWorkViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        initOfficeEventItems()
    }
    
    func initOfficeEventItems(){
        let count = officeEvents.count
        let realCount = (count / 2) + Int(arc4random()) % (count / 2)
        var dc = [Int:Bool]()
        var kickLeft = count - realCount
        
        var now:Int = 0
        while kickLeft > 0 {
            var next = random() % count
            if nil == dc[next] {
                --kickLeft
                dc[next] = true
            }
        }
        
        var theArray = [(Int,String)]()
        for i in 0..<count{
            var p:(Int,String)?
            if nil == dc[i] {
                p = (i, officeEvents[i].name)
            }
            if p != nil {
                theArray.append(p!)
            }
        }
        selectiveEvents = theArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    var selectiveEvents:[(Int, String)]!
    var events:[OfficeEvent]!
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return events.count
        return selectiveEvents.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OfficeEventCell", forIndexPath: indexPath) as UITableViewCell
        // Configure the cell...
        var row = indexPath.row
        //cell.detailTextLabel?.text = events[row].name
        //cell.textLabel?.text =  events[row].name
        let (index, name) = selectiveEvents[row]
        cell.textLabel?.text = name
        return cell
    }

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        //println("Before changes Site 2000A")

        /*
        if segue.identifier == "WorkPerformed" {
            let cell = sender as UITableViewCell
            if let workText = cell.textLabel?.text {
                var offset = find(events.map{(a:OfficeEvent)->String in return a.name}, workText)
                workPerformed = offset
                let msg = officeEvents[offset!].description()
            }
        }*/
        
        if segue.identifier == "WorkPerformed" {
            let cell = sender as UITableViewCell
            if let workText = cell.textLabel?.text {

                /*
                //method one
                for (offset, text) in selectiveEvents{
                    if text == workText {
                        workPerformed = offset
                        break
                    }
                }
                */
                workPerformed = selectiveEvents.filter{ $0.1 == workText }[0].0
            }
        }
    }
    
    var workPerformed:Int?
}
