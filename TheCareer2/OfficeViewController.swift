//
//  OfficeViewController.swift
//  TheCareer2
//
//  Created by baihai on 15/2/6.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class OfficeViewController: UITableViewController, UIAlertViewDelegate {

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

    //They do count
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if 0 == section {
            return 4
        } else if 1 == section {
            return 4
        }
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("PropertyCell", forIndexPath: indexPath)
                as SinglePropertyViewCell
            
            var row = indexPath.row
            switch row {
            case 0:
                cell.setContent("生命", value:MasterPlayer.coder.life)
            case 1:
                cell.setContent("智利", value:MasterPlayer.coder.intelligence)
            case 2:
                cell.setContent("天朝币", value:MasterPlayer.coder.money)
            case 3:
                cell.setContent("股份", value:MasterPlayer.coder.shares)
            default:
                ()
            }

            // Configure the cell...
            return cell
        }
        */
        return super.tableView(tableView, cellForRowAtIndexPath:indexPath)
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
    
    func updateProperties(){
        let cells = [propertyCell_0, propertyCell_1, propertyCell_2, propertyCell_3, propertyCell_4]
        for cell in cells{
            cell.sync()
        }
    }
    
    //~
    @IBAction func onWorkPerformed(segue:UIStoryboardSegue, sender:AnyObject?){
        //println("OK, back from work performance")
        let workPermView = segue.sourceViewController as OfficeWorkViewController
        if let performed = workPermView.workPerformed {
            //println("You performed one case **********************")
            let ev = officeEvents[performed]
            println(ev.name)
            MasterPlayer.receiveWork(performed)
            postProcess(ev)
            updateProperties()
        }
    }
    
    @IBAction func onSportsPerformed(segue:UIStoryboardSegue, sender:AnyObject?){
        let sportsView = segue.sourceViewController as SportsFieldViewController
        if let sportsIndex = sportsView.sportsSelected {
            //println("You perfomed one sports *******")
            let ev = sportsEvents[sportsIndex]
            println(ev.name)
            MasterPlayer.receiveSports(sportsIndex)
            postProcess(ev)
            updateProperties()
        }
    }
    
    @IBAction func onMcDonaldPerformed(segue:UIStoryboardSegue, sender:AnyObject?){
        let mcView = segue.sourceViewController as McDonaldRestaurantSceneViewController
        if let foodIndex = mcView.foodSelected{
            let ev = mcDonaldEvents[foodIndex]
            println(ev.name)
            MasterPlayer.receiveFood(foodIndex)
            postProcess(ev)
            updateProperties()
        }
    }
    
    func postProcess(event:EventProto){
        pendingEvent = genRandomEvent()
        promptPlayer(event)
        
        ++actionTakenCount
        if actionTakenCount >= ActionPerDay {
            actionTakenCount = 0
            if MasterPlayer.decreaseDays() {
                endOfGame = true
            }
        }
    }
    
    func checkGame(){
        if MasterPlayer.isOutOfDays {
            var msg = "工作完毕, 你带着\(MasterPlayer.coder.money)元回家了"
            var aView = UIAlertView(title:"时间到",message:msg, delegate:self, cancelButtonTitle:"好")
            aView.tag = TagGameOver
            aView.show()
        }
    }
    
    func promptPlayer(event:EventProto){
        var aView = UIAlertView(title:"完成", message:event.description(), delegate:self, cancelButtonTitle:"好")
        aView.tag = TagRoutine
        aView.show()
    }
    
    func promptRandomEvent(){
        if pendingEvent != nil {
            MasterPlayer.receiveEvent(pendingEvent!)
            updateProperties()
            var aView = UIAlertView(title:"突发", message:pendingEvent?.description(), delegate:self, cancelButtonTitle:"好")
            aView.tag = TagAftermath
            aView.show()
            pendingEvent = nil
            return  // OVER
        }
        
        checkGame()
    }
    
    //UIAlertViewDelegate>>>
//    func alertViewCancel(alertView: UIAlertView){
//        println("Yes")
//    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int){
        println("Dismiss with index \(buttonIndex), tag \(alertView.tag)")
            // Only one button, the default one(CANCEL)
        promptRandomEvent()
    }
    
    @IBAction func onClickDaTu(sender: UIButton) {
        UIAlertView(title:"敬请期待", message:"尚未竣工", delegate:nil, cancelButtonTitle:"好").show()
    }
    
    var actionTakenCount:Int = 0
    var pendingEvent:RandomEvent?
    var endOfGame = false
    
    @IBOutlet weak var propertyCell_4: SinglePropertyViewCell!
    @IBOutlet weak var propertyCell_3: SinglePropertyViewCell!
    @IBOutlet weak var propertyCell_2: SinglePropertyViewCell!
    @IBOutlet weak var propertyCell_1: SinglePropertyViewCell!
    @IBOutlet weak var propertyCell_0: SinglePropertyViewCell!

}
