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

    let wc = WorkoutController()
    
    var isClientSide: Bool? {
        didSet {
            print("WorkoutListTableViewController isClientSide isSet!")
        }
    }
    var client: Client? {
        didSet {
            print("WorkoutListTableViewController client is set!")
        }
    }
    var instructor: Instructor? {
        didSet {
            print("WorkoutListTableViewController Instructor is set!")
        }
    }
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBarProperties: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - IBActions
    @IBAction func goToSettingsScene(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let client = client {
            return client.workouts?.count ?? 0
        }
        
        if let instructor = instructor {
            return instructor.workouts?.count ?? 0
        }
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutListTableViewCell

        // Configure the cell...
        if let client = client {
            let workout = client.workouts?[indexPath.row]
            cell.workout = workout
        } else if let instructor = instructor {
            let workout = instructor.workouts?[indexPath.row]
            cell.workout = workout
        }
        
        return cell
    }
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let client = client {
                guard let workoutToDelete = client.workouts?[indexPath.row] else { return }
                wc.delete(workout: workoutToDelete)
            } else if let instructor = instructor {
                guard let workoutToDelete = instructor.workouts?[indexPath.row] else { return }
                wc.delete(workout: workoutToDelete)
            }
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpSegue" {
            //pass over the value of isClientSide
            guard let destinationVC = segue.destination as? DetailWorkoutViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            var workoutToPass:Workout?
            
            if let client = client {
                let workout = client.workouts?[indexPath.row]
                workoutToPass = workout
            } else if let instructor = instructor {
                let workout = instructor.workouts?[indexPath.row]
                workoutToPass = workout
            }
            destinationVC.workout = workoutToPass
            destinationVC.isClientSide = isClientSide
            destinationVC.client = client
            destinationVC.instructor = instructor
        }
        
    }
  

}
