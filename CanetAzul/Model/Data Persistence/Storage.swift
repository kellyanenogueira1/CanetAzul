//
//  Storage.swift
//  CanetAzul
//
//  Created by Kellyane Nogueira on 19/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class Storage{
    var driveURL: URL!
    var filemanager = FileManager.default
    
    init(){
        if let containerURL = filemanager.url(forUbiquityContainerIdentifier: nil) {
            let tryURL = containerURL.appendingPathComponent("Documents")
            do {
                if (filemanager.fileExists(atPath: tryURL.path, isDirectory: nil) == false) {
                    try filemanager.createDirectory(at: tryURL, withIntermediateDirectories: true, attributes: nil)
                }
                self.driveURL = tryURL
            } catch {
                print("ERROR: Cannot create /Documents on iCloud \(error)")
            }
        } else {
            print("ERROR: Cannot get ubiquity container")
        }
    }
    
    func createFile(_ text: Text) -> Bool{
        if let data = try? JSONEncoder().encode(text) {
            var fileUrl = self.driveURL.appendingPathComponent(text.idText)
            fileUrl = fileUrl.appendingPathExtension("json")
            do{
                try data.write(to: fileUrl)
                return true
            } catch {
                print("This file cannot be created")
                return false
            }
        }
        return false
    }
    
    func updateFile(_ idText: String) -> Bool{
        var fileUrl = self.driveURL.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        if filemanager.fileExists(atPath: fileUrl.path){
            if let data = try? JSONEncoder().encode(idText){
                do{
                    try data.write(to: fileUrl)
                    return true
                } catch {
                    print(error.localizedDescription)
                    return false
                }
            }
        }
        return false
    }

    func readFile(_ idText: String) -> Text?{
        var fileUrl = self.driveURL.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: fileUrl)
            let returnedText = try JSONDecoder().decode(Text.self, from: data)
            return returnedText
        } catch {
            return nil
        }
    }
    
    func readAllFiles() -> [Text]?{
        var texts: [Text] = []
        if let data = try? Data(contentsOf: self.driveURL){
            do{
                var texts = try JSONDecoder().decode([Text].self, from: data)
                return texts
            } catch {
                return texts //Files cannot became an object
            }
        }
        return nil //Files of path is not read
    }
    
    func deleteFile(_ idText: String) -> Bool{
        var fileUrl = self.driveURL.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: fileUrl)
            var returnedText = try JSONDecoder().decode(Text.self, from: data)
            returnedText.idText = ""
            return true
        } catch {
            return false
        }
    }
    
}
