//
//  DetailWorkoutViewController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit
/*
 CLIENT: Delete workout, Purchase Punch, Join workout
 For the client the text fields have to be inactive, user shouldnt be able to change anything
 */

/*
 INSTRUCTOR: Delete class, OFFER Punch, Create class, Edit Class
 */

class DetailWorkoutViewController: UIViewController {
    
    var wc: WorkoutController?
    var workout: Workout?
    
    var isClientSide: Bool? {
        didSet {
            print("WorkoutListTableViewCell isClientSide isSet!")
        }
    }
    var client: Client? {
        didSet {
            print("WorkoutListTableViewCell client is set!")
        }
    }
    var instructor: Instructor? {
        didSet {
            print("WorkoutListTableViewCell Instructor is set!")
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
