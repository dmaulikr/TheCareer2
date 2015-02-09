//
//  PlayerInfoViewController.swift
//  TheCareer2
//
//  Created by baihai on 15/2/5.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UITableViewController {

    var _careerTypeSelected:String = "CoderOne"
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
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }*/


    
    // Static cell does not give a damn about it
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    
    // Static cell does not give a damn about it 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("Static Cell do not reach here")
        fatalError("No no no ")
        if indexPath.section == 0 {
            let names = ["CoderOne", "CoderTwo", "CoderThree"]
            for i in names {
                if let cell = tableView.dequeueReusableCellWithIdentifier("Coder", forIndexPath: indexPath)
                    as? UITableViewCell {
                    cell.accessoryType = .Checkmark
                    return cell
                }
            }
            return super.tableView(tableView, cellForRowAtIndexPath:indexPath)
        } else {
            return super.tableView(tableView, cellForRowAtIndexPath:indexPath)
        }
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onCoderTypeSelected(segue:UIStoryboardSegue, sender:AnyObject?){
        let pickerView = segue.sourceViewController as PickCareerTypeViewController
        MasterPlayer.career = pickerView.careerType
        careerTypeLabel.text = MasterPlayer.career.description()
    }
    
    @IBAction func onGenderTypeSelected(segue:UIStoryboardSegue, sender:AnyObject?){
        let pickerView = segue.sourceViewController as PickGenderViewController
        MasterPlayer.gender = pickerView.genderType
        genderTypeLabel.text = MasterPlayer.gender.description()
    }
    
    @IBAction func onHobbySelected(segue:UIStoryboardSegue, sender:AnyObject?){
        let hobbyView = segue.sourceViewController as HobbyViewController
        println("Hobby selected done")
        if let h = hobbyView.hobby {
            hobbyLabel.text = h
        }
    }
    
    @IBAction func onClickStartingGame(sender: UIButton) {
        UIAlertView(title:"游戏开始", message:"做好觉悟吧 少年!", delegate:nil
            , cancelButtonTitle:"知道了").show()
    }

    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var careerTypeLabel: UILabel!
    @IBOutlet weak var genderTypeLabel: UILabel!
}
