//
//  AddBehaviorTableViewController.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 6/4/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import UIKit

class AddBehaviorTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var buttonPairingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var pairedInterventionTextField: UITextField!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var countNumberLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func countChanged(_ sender: UIStepper) {
        countNumberLabel.text = "\(Int(countStepper.value))"
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    func updateSaveButtonState () {
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let behavior = behavior{
            navigationItem.title = "Edit Behavior"
            nameTextField.text = behavior.name
            descriptionTextField.text = behavior.description
            switch behavior.assignedButton{
            case .single: buttonPairingSegmentedControl.selectedSegmentIndex = 0
            case .double: buttonPairingSegmentedControl.selectedSegmentIndex = 1
            case .hold: buttonPairingSegmentedControl.selectedSegmentIndex = 2
            case .none: buttonPairingSegmentedControl.selectedSegmentIndex = 3
            }
            pairedInterventionTextField.text = behavior.experimentPairedIntervention
            countStepper.value = Double(behavior.count)
            countNumberLabel.text = String(behavior.count)
        }
        else {print("new behavior")}
        updateSaveButtonState()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
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

    
    // MARK: - Navigation

    var behavior:Behavior?
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return}
        
        let name = nameTextField.text!
        let description = descriptionTextField.text!
        
        let segmentIndex = buttonPairingSegmentedControl.selectedSegmentIndex
        var buttonPairing:buttonOptions
        switch segmentIndex{
        case 0:buttonPairing = .single
        case 1:buttonPairing = .double
        case 2:buttonPairing = .hold
        case 3: buttonPairing = .none
        default:
            buttonPairing = .none
        }
        
        let pairedIntervention = pairedInterventionTextField.text!
        let count = Int(countStepper.value)
        
        behavior=Behavior(name: name, description: description, assignedButton: buttonPairing, experimentPairedIntervention: pairedIntervention, count: count)
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       /*
         
         NOTES/QUESTIONS:
         1. Why does name and description above require a force-unwrap?
         */
    }
    

}
