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
    
    func createClient(username: String, password: String){
        let newClient = Client(username: username, password: password)
        clients.append(newClient)
        
        //SAVETOPERSISTSTORE
    }
    
    //add and remove punch passes, classes
    func updateWorkoutPassesAndUsesremaining(client: Client, newWorkouts: [Workout]?, newPasses: [PunchPass]?, newUsesremaining: Int?){
        client.workouts = newWorkouts
        client.passes = newPasses
        client.usesRemaining = newUsesremaining
    }
    
    func updateSettings(of client: Client, newUsername: String, newPassword: String){
        client.username = newUsername
        client.password = newPassword
    }

}
