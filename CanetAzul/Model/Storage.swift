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
        driveURL = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func createFile(_ text: Text){
        if let data = try? JSONEncoder().encode(text) {
            var fileUrl = self.driveURL!.appendingPathComponent(text.idText)
            fileUrl = fileUrl.appendingPathExtension("json")
            do{
                try data.write(to: fileUrl)
            } catch {
                print("This file cannot be created")
            }
        }
    }
    
    func updateFile(_ editedText: Text) -> Bool{
        var fileUrl = self.driveURL!.appendingPathComponent(editedText.idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        if filemanager.fileExists(atPath: fileUrl.path){
            if let data = try? JSONEncoder().encode(editedText){
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

    func readFile(_ idText: String) -> Text{
        var fileUrl = self.driveURL!.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: fileUrl)
            let returnedText = try JSONDecoder().decode(Text.self, from: data)
            return returnedText
        } catch {
            print("Failed to read text")
            fatalError()
        }
    }
    
    func readAllFiles() -> [Text]{
        var texts: [Text] = []
        do{
            let data = try Data(contentsOf: self.driveURL!)
            texts = try JSONDecoder().decode([Text].self, from: data)
            return texts
        } catch {
            print("Failed to read texts")
            return texts
        }
    }
    
    func deleteFile(_ idText: String){
        var fileUrl = self.driveURL!.appendingPathComponent(idText)
        fileUrl = fileUrl.appendingPathExtension("json")
    }
    
}
