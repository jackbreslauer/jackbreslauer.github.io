//
//  LogStreamTableViewController.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 6/13/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import UIKit
import fliclib

class LogStreamTableViewController: UITableViewController, SCLFlicManagerDelegate, SCLFlicButtonDelegate {
    
    func flicManager(_ manager: SCLFlicManager, didGrab button: SCLFlicButton?, withError error: Error?) {
        
    }
    

var logs = [Log]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("we're on logstream")
        
        if let savedlogs = Log.loadLogs(){
            logs = savedlogs
        }
        else{
            return 
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return logs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "logCell") as? LogTableViewCell else {fatalError("could not dequeue a cell")}

        let log = logs[indexPath.row]
        cell.linkedBehaviorLabel.text = log.linkedBehavior.name
        //cell.timestampLabel.text = log.dateLogged.
        // Configure the cell...

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        cell.timestampLabel.text = dateFormatter.string(from: log.dateLogged)
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
    @IBAction func addNewLog(segue:UIStoryboardSegue){
        guard segue.identifier == "saveToLogstream" else {print("NAA"); return}
        print("eh??")
        let sourceViewController = segue.source as! AddLogTableViewController
        if let log = sourceViewController.log {
            let newIndexPath = IndexPath(row:logs.count, section:0)
            logs.append(log)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            print(logs)
        }
        Log.saveLogs(logs)

    }
}
