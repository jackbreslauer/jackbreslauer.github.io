//
//  AddLogTableViewController.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 6/13/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import UIKit

class AddLogTableViewController: UITableViewController {

    
    @IBOutlet weak var linkedBehaviorLabel: UILabel!
    @IBOutlet weak var dateLoggedLabel: UILabel!
    @IBOutlet weak var dateLoggedPicker: UIDatePicker!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var intensitySlider: UISlider!
    @IBOutlet weak var triggerTextField: UITextField!
    @IBOutlet weak var intensityLabel: UILabel!
    
    
    
    
    
    @IBAction func dateLoggedPickerChanged(_ sender: UIDatePicker) {
        updateLogDateLabel()
    }
    @IBAction func intensitySliderChanged(_ sender: UISlider) {
        intensityLabel.text = "\(Int(intensitySlider.value))"
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(linkedBehavior)
        linkedBehaviorLabel.text = linkedBehavior?.name
        updateLogDateLabel()
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    var log : Log?
    var linkedBehavior: Behavior?
    
    
    func updateLogDateLabel(){
        
       // let dateLogged = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateLoggedLabel.text = dateFormatter.string(from: dateLoggedPicker.date)
        
    }
    
    let loggedDatePickerCellIndexPath = IndexPath(row:2, section:0)
    var isLoggedDatePickerShown: Bool = false {
        didSet {
            dateLoggedPicker.isHidden = !isLoggedDatePickerShown
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row){
        case (loggedDatePickerCellIndexPath.section, loggedDatePickerCellIndexPath.row):
            if isLoggedDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default: return 44.0

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath.section,indexPath.row){
        case(loggedDatePickerCellIndexPath.section, loggedDatePickerCellIndexPath.row - 1):
            if isLoggedDatePickerShown {
                isLoggedDatePickerShown = false
            }
            else{
                isLoggedDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default: break

        }
    }

    // MARK: - Table view data source



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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveToLogstream" else {return}
        
        let dateLogged = dateLoggedPicker.date
        let location = locationTextField.text
        let intensity = Int(intensitySlider.value)
        let trigger = triggerTextField.text
        
        log = Log(linkedBehavior: linkedBehavior!, dateLogged: dateLogged, location: location ?? "none", intensity: intensity, trigger: trigger ?? "none")
        print(log)
    }

    
}

