//
//  BehaviorListTableViewController.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 5/30/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import UIKit
import fliclib

class BehaviorListTableViewController:UITableViewController, behaviorCellDelegate, SCLFlicManagerDelegate, SCLFlicButtonDelegate   {
    
    
    func flicManager(_ manager: SCLFlicManager, didGrab button: SCLFlicButton?, withError error: Error?) {
        
    }
    
   
    let SCL_APP_ID: String = "5480ebcd-51d8-4903-91a7-8b42425e6c38"
    let SCL_APP_SECRET: String = "e13c3aac-0d6a-468e-aa64-ae39463f49ca"
    
    var rowIndex:Int = 0
    
    func logButtonTapped(sender: behaviorCell) {
        
        
        let buttonPosition = sender.convert(sender.bounds.origin, to:tableView)
        if let indexPath = tableView.indexPathForRow(at: buttonPosition){
            rowIndex = indexPath.row
            print(rowIndex)
        }
 
        if let indexPath = tableView.indexPath(for: sender){
            var behavior = behaviors[indexPath.row]
            behavior.count += 1
            behaviors[indexPath.row] = behavior
            tableView.reloadRows(at: [indexPath], with: .automatic)
        
            Behavior.saveBehaviors(behaviors)
            
          
        }
    }
    

  
    
    
    var behaviors = [Behavior]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if let savedBehaviors = Behavior.loadBehaviors(){
           behaviors = savedBehaviors
         }
        else{
        behaviors = Behavior.SampleBehaviors()
        print(behaviors)
         }
        
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        SCLFlicManager.configure(with: self, defaultButtonDelegate: self, appID: SCL_APP_ID, appSecret: SCL_APP_SECRET, backgroundExecution: false)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return behaviors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "behaviorCell") as? behaviorCell else {fatalError("could not dequeue a cell")}
        
        cell.delegate = self

        let behavior = behaviors[indexPath.row]
        cell.nameLabel.text = behavior.name
        
     
        
        
        
        return cell
        
        
        
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            behaviors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Behavior.saveBehaviors(behaviors)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let behaviorViewController = segue.destination as! AddBehaviorTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedBehavior = behaviors[indexPath.row]
            behaviorViewController.behavior = selectedBehavior
        }
        else if segue.identifier == "showLogDetails" {
            let logViewController = segue.destination as! AddLogTableViewController
            let linkedBehavior = behaviors[rowIndex]
            print(rowIndex)
            logViewController.linkedBehavior = linkedBehavior
    }
    }
    
    @IBAction func unwindToBehaviorsList(segue:UIStoryboardSegue){
        guard segue.identifier == "saveUnwind" else {return}
        let sourceViewController = segue.source as! AddBehaviorTableViewController
        
        if let behavior = sourceViewController.behavior {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                behaviors[selectedIndexPath.row] = behavior
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else{ let newIndexPath = IndexPath(row: behaviors.count, section: 0)
            behaviors.append(behavior)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        Behavior.saveBehaviors(behaviors)
    }
 
    
}
