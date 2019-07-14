//
//  File.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 5/30/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import Foundation

struct Behavior: Codable {
    
    var name:String
    var description:String
    var assignedButton:buttonOptions
    var experimentPairedIntervention:String
    var count:Int
    

    
    static func SampleBehaviors()->[Behavior] {
        let behavior1 = Behavior(name: "General Anxiety", description: "Feeling of worry about the future with no commonly identifiable theme", assignedButton: .single, experimentPairedIntervention:"Breathing exercise",count: 0)
        let behavior2 = Behavior(name: "General Anger", description: "Feeling of anger about past or present events that is not a common pattern", assignedButton: .double, experimentPairedIntervention: "Get over it!", count:0)
        let behavior3 = Behavior(name: "Other", description: "Anything else", assignedButton: .hold, experimentPairedIntervention: "Scream into bag", count:0)
        return [behavior1, behavior2, behavior3]
    }
    
    
 //Logic for storing and loading behaviors
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("behaviors").appendingPathExtension("plist")
    
    static func loadBehaviors()-> [Behavior]? {
        
        guard let codedBehaviors = try? Data(contentsOf: ArchiveURL)
        else {return nil}
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode(Array<Behavior>.self, from:codedBehaviors)
    
}
    
    static func saveBehaviors(_ behaviors:[Behavior]){
        
        let propertyListEncoder = PropertyListEncoder()
        
        let codedBehaviors = try? propertyListEncoder.encode(behaviors)
        try? codedBehaviors?.write(to:ArchiveURL, options:.noFileProtection)
    }
    
//Need to figure out how to refer sample behavior to a sample intervention


}

//Other model objects

enum buttonOptions: String, Codable {
    
    case single
    case double
    case hold
    case none
}


struct Intervention {
    var name:String
    var instructions:String
    
    static var sample:Intervention{
        return Intervention(name: "Breathing Exercise", instructions: "Take 5 deep breaths, counting upwards to five on the inhale, and downwards from five on the exhale")
    }
}
