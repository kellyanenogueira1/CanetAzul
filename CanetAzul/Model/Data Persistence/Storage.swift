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
        //self.driveURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
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
            var fileUrl = self.driveURL.appendingPathComponent(text.id)
            fileUrl = fileUrl.appendingPathExtension("json")
            if !filemanager.fileExists(atPath: fileUrl.path){
                do{
                    try data.write(to: fileUrl)
                    return true
                } catch {
                    return false
                }
            } else {
                return updateFile(text.id)
            }
        }
        return false
    }
    
    func updateFile(_ idText: String) -> Bool{
        var fileUrl = self.driveURL.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        //if filemanager.fileExists(atPath: fileUrl.path){
        if let data = try? JSONEncoder().encode(idText){
            do{
                try data.write(to: fileUrl)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
        //}
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
        //if let data = try? Data(contentsOf: self.driveURL){
        do {
            let fileURLs = try filemanager.contentsOfDirectory(at: self.driveURL, includingPropertiesForKeys: nil)
            print(fileURLs.count)
            
            for fileURL in fileURLs{
                print(fileURL.absoluteString)
                let data = try Data(contentsOf: fileURL)
                //print(String(data: data, encoding: .utf8))
                do {
                    let returnedText = try JSONDecoder().decode(Text.self, from: data)
                    texts.append(returnedText)
                } catch {
                    print(error)
                }
            }
            
            // process files
        } catch {
            print(error)
            return nil
        }
        // }
        return texts //Files of path is not read
    }
    
    func deleteFile(_ idText: String) -> Bool{
        var fileUrl = self.driveURL.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        do {
            try filemanager.removeItem(at: fileUrl)
            return true
        } catch {
            return false
        }
    }
    
}
