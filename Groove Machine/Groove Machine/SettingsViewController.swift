//
//  SettingsViewController.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 6/26/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import UIKit
import fliclib

class SettingsViewController: UIViewController, SCLFlicButtonDelegate, SCLFlicManagerDelegate {
    
    func flicManager(_ manager: SCLFlicManager, didGrab button: SCLFlicButton?, withError error: Error?) {
        if (error != nil) {
            print("Error: \(error!._domain) - \(error!._code)")
            return
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func grabFlicButtonPressed(_ sender: Any) {
            print("Grabbing a flic..")
            SCLFlicManager.shared()?.grabFlicFromFlicApp(withCallbackUrlScheme: "groovemachineasfkhabvsfaiuegfn")
    }
    
    
        // TODO: Here would be a good place to set the Flic latency in case you need lower latency
        //       Consider choosing your prefered triggerBehavior as well (Click / hold is default)
    
    func flicButton(_ button: SCLFlicButton, didReceiveButtonDown queued: Bool, age: Int) {
        print("it works!")
    }
    
    func flicButton(_ button: SCLFlicButton, didReceiveButtonClick queued: Bool, age: Int) {
        print("Flic was clicked..")
    }
    
    }



    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


