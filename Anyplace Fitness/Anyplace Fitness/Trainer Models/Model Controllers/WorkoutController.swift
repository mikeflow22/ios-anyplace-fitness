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
    
    func createWorkout(name: String, schedule: String, location: String, instructorName: String){
        let newWorkout = Workout(name: name, schedule: schedule, location: location, instructorName: instructorName)
        workouts.append(newWorkout)
        
        //SAVE TO PERSISTENT STORE
    }
    
    func delete(workout: Workout){
        guard let workoutToDelete = workouts.firstIndex(of: workout) else { return }
            workouts.remove(at: workoutToDelete)
        
        //SAVE TO PERSISTENT STORE
    }
    
    func update(workout: Workout, newName: String, newSchedule: String, newLocation: String, newClient: [Client]?, newPunchPass: [PunchPass]?, newImage: String?){
        workout.name = newName
        workout.schedule = newSchedule
        workout.location = newSchedule
        workout.clients = newClient
        workout.image = newImage
        
        //SAVE TO PERSISTENT STORE
    }
    
}
