//
//  Log.swift
//  Groove Machine
//
//  Created by Jack Breslauer on 6/13/19.
//  Copyright © 2019 Jack Breslauer. All rights reserved.
//

import Foundation

struct Log:Codable{
    var linkedBehavior: Behavior
    var dateLogged: Date
    var location: String
    var intensity:Int
    var trigger:String
    
    
    //Logic for storing and loading behaviors
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("logs").appendingPathExtension("plist")
    
    static func loadLogs()-> [Log]? {
        
        guard let codedLogs = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode(Array<Log>.self, from:codedLogs)
        
    }
    
    static func saveLogs(_ logs:[Log]){
        
        let propertyListEncoder = PropertyListEncoder()
        
        let codedLogs = try? propertyListEncoder.encode(logs)
        try? codedLogs?.write(to:ArchiveURL, options:.noFileProtection)
    }
    
}
