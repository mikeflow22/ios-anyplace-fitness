//
//  ClientController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class ClientController {
    var clients = [Client]()
    
    var persistenceURL: URL? {
        let fileManger = FileManager.default
        guard let documentDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = documentDirectory.appendingPathComponent("clients.plist")
        return fileName
    }
    
    init(){
        loadFromPersistentStore()
    }
    
    func createClient(username: String, password: String) -> Client{
        let newClient = Client(username: username, password: password)
        clients.append(newClient)
        saveToPersistentStore()
        return newClient
    }
    
    func clientSignIn(client: Client) -> Bool {
        if clients.contains(client) {
            return true
        }
        return false
    }
    
    //add and remove punch passes, classes
    func updateWorkoutPassesAndUsesremaining(client: Client, newWorkouts: [Workout]?, newPasses: [PunchPass]?, newUsesremaining: Int?){
        client.workouts = newWorkouts
        client.passes = newPasses
        client.usesRemaining = newUsesremaining
        
        saveToPersistentStore()
    }
    
    func updateSettings(of client: Client, newUsername: String, newPassword: String){
        client.username = newUsername
        client.password = newPassword
       
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        guard let url = persistenceURL else {
            print("Error unwrapping url savingToPersistentStore")
            return }
        
        let propertyListEncoder = PropertyListEncoder()
        do {
            let data = try propertyListEncoder.encode(clients)
            try data.write(to: url)
        } catch  {
            print("Error encoding model to persistent store: \(error.localizedDescription)")
            return
        }
    }
    
    func loadFromPersistentStore(){
        //we have to check to see if url path is there by checking the filemanager's file Exists method
        let fm = FileManager.default
        guard let url = persistenceURL, fm.fileExists(atPath: url.path) else { return }
        
        let propertyListDecoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let clients = try propertyListDecoder.decode([Client].self, from: data)
            self.clients = clients
        } catch  {
            print("Error decoding data in the loadFromPersitenceStore do-catch: \(error.localizedDescription)")
            return
        }
    }

}
