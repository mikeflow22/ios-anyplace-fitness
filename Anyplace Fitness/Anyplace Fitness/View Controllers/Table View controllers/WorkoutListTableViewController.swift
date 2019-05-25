//
//  WorkoutListTableViewController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

//DELETE CLASSES 
class WorkoutListTableViewController: UITableViewController {
    
    //MOCK INSTRUCTORS DATA
    var workouts = [Workout]()

    let wc = WorkoutController()
    
    var isClientSide: Bool? {
        didSet {
            print("WorkoutListTableViewController isClientSide isSet!")
        }
    }
    var client: Client? {
        didSet {
            print("WorkoutListTableViewController client is set!")
            tableView.backgroundColor = .magenta
        }
    }
    var instructor: Instructor? {
        didSet {
            print("WorkoutListTableViewController Instructor is set!")
            tableView.backgroundColor = .green
        }
    }
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBarProperties: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMockData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        loadMockData()
    }

    //MARK: - IBActions
    @IBAction func goToSettingsScene(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if let client = client {
//            return client.workouts?.count ?? 0
//        }
//
//        if let instructor = instructor {
//            return instructor.workouts?.count ?? 0
//        }
//        return 2
        
        //MOCK DATA
        return workouts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutListTableViewCell

        // Configure the cell...
//        if let client = client {
//            let workout = client.workouts?[indexPath.row]
//            cell.workout = workout
//        } else if let instructor = instructor {
//            let workout = instructor.workouts?[indexPath.row]
//            cell.workout = workout
//        }
        
        //MOCK DATA
        let workout = workouts[indexPath.row]
//        cell.dayLabel.text = workout.schedule
//        cell.workoutNameLabel.text = workout.name
        cell.workout = workout
        return cell
    }

    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//            if let client = client {
//                guard let workoutToDelete = client.workouts?[indexPath.row] else { return }
//                wc.delete(workout: workoutToDelete)
//            } else if let instructor = instructor {
//                guard let workoutToDelete = instructor.workouts?[indexPath.row] else { return }
//                wc.delete(workout: workoutToDelete)
//            }
//
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    
    func loadMockData(){
        guard let instructor = instructor else { return }
        workouts += [
        Workout(name: "Yoga", schedule: "9am Monday", location: "123 Relax st.", instructorName: instructor.username),
        Workout(name: "Pilates", schedule: "4pm Monday", location: "123 Core st", instructorName: instructor.username),
        Workout(name: "Barre", schedule: "10am Tuesday", location: "345 Dance ln", instructorName: instructor.username),
        Workout(name: "Crossfit", schedule: "5am Wednesday", location: "456 Heartrate ln", instructorName: instructor.username),
        Workout(name: "Kickboxing", schedule: "6pm Wednesday", location: "456 Punch pkwy", instructorName: instructor.username),
        Workout(name: "KettleBell", schedule: "4pm Thursday", location: "567 Kettlbell rd", instructorName: instructor.username),
        Workout(name: "Trampoline", schedule: "10am Friday", location: "789 Jump st", instructorName: instructor.username),
        Workout(name: "Step", schedule: "5pm Friday", location: "789 Stepping ln", instructorName: instructor.username)
        ]
//        tableView.reloadData()
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellSegue" {
            //pass over the value of isClientSide
            guard let destinationVC = segue.destination as? DetailWorkoutViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
//            var workoutToPass:Workout?
//
//            if let client = client {
//                let workout = client.workouts?[indexPath.row]
//                workoutToPass = workout
//            } else if let instructor = instructor {
//                let workout = instructor.workouts?[indexPath.row]
//                workoutToPass = workout
//            }
//
//            destinationVC.workout = workoutToPass
//            destinationVC.isClientSide = isClientSide
//            destinationVC.client = client
//            destinationVC.instructor = instructor
            destinationVC.wc = wc
            
            //MOCK DATA
            let mockWorkout = workouts[indexPath.row]
            print("this is the mock workout that should be sent to detail view: \(mockWorkout.name)")
           destinationVC.workout = mockWorkout
        }
        
    }
  

}
