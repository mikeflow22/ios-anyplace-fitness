//
//  WorkoutController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class WorkoutController {
    var workouts = [Workout]()
    
    var persistenceURL: URL? {
        let fileManger = FileManager.default
        guard let documentDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = documentDirectory.appendingPathComponent("workouts.plist")
        return fileName
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func createWorkout(name: String, schedule: String, location: String, instructorName: String){
        let newWorkout = Workout(name: name, schedule: schedule, location: location, instructorName: instructorName)
        workouts.append(newWorkout)
        
        saveToPersistentStore()
    }
    
    func delete(workout: Workout){
        guard let workoutToDelete = workouts.firstIndex(of: workout) else { return }
            workouts.remove(at: workoutToDelete)
        
        saveToPersistentStore()
    }
    
    func update(workout: Workout, newName: String, newSchedule: String, newLocation: String, newClient: [Client]?, newPunchPass: [PunchPass]?, newImage: String?){
        workout.name = newName
        workout.schedule = newSchedule
        workout.location = newSchedule
        workout.clients = newClient
        workout.image = newImage
        
       saveToPersistentStore()
    }
    
    //add client to workout
    func add(client: Client, toWorkout: Workout){
        toWorkout.clients?.append(client)
        
        saveToPersistentStore()
    }
    
    //delete client from workout
    func remove(client: Client, fromWorkout workout: Workout){
        guard let clientToRemove = workout.clients?.firstIndex(of: client) else { return }
        workout.clients?.remove(at: clientToRemove)
        
        saveToPersistentStore()
    }
    
    //punchpass to workout
    func include(punchPasses: [PunchPass], toWorkout workout: Workout){
        workout.punchPass = punchPasses
        
        saveToPersistentStore()
    }

    func saveToPersistentStore(){
        guard let url = persistenceURL else {
            print("Error unwrapping workouts: url savingToPersistentStore")
            return }
        
        let propertyListEncoder = PropertyListEncoder()
        do {
            let data = try propertyListEncoder.encode(workouts)
            try data.write(to: url)
        } catch  {
            print("Error encoding workouts model to persistent store: \(error.localizedDescription)")
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
            let workouts = try propertyListDecoder.decode([Workout].self, from: data)
            self.workouts = workouts
        } catch  {
            print("Error decoding workouts data in the loadFromPersitenceStore do-catch: \(error.localizedDescription)")
            return
        }
    }
}
