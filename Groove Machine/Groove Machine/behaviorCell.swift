//
//  behaviorCell.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 6/8/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import Foundation
import UIKit

protocol behaviorCellDelegate {
    func logButtonTapped(sender:behaviorCell)
    
}
class behaviorCell: UITableViewCell{
    
    var delegate: behaviorCellDelegate?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logButton: UIButton!
    
    @IBAction func logButtonTapped(_ sender: Any) {
        
        delegate?.logButtonTapped(sender: self)
   
    }
    

}
