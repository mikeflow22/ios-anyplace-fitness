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
    
    var wc: WorkoutController? {
        didSet {
            print("DetailWorkoutViewController WC is set!")
        }
    }
    var workout: Workout? {
        didSet {
            print("DetailWorkoutViewController workout is set!")
        }
    }
    
//    var isClientSide: Bool? {
//        didSet {
//            print("WorkoutListTableViewCell isClientSide isSet!")
//        }
//    }
//    var client: Client? {
//        didSet {
//            print("WorkoutListTableViewCell client is set!")
//        }
//    }
//    var instructor: Instructor? {
//        didSet {
//            print("WorkoutListTableViewCell Instructor is set!")
//        }
//    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var workoutNameTF: UITextField!
    @IBOutlet weak var workoutLocationTF: UITextField!
    @IBOutlet weak var workoutScheduleTF: UITextField!
    @IBOutlet weak var punchPassProperties: UIButton!
    @IBOutlet weak var segmentedProperties: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func punchPassButton(_ sender: UIButton) {
    }
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateViews(){
        guard let passedInWorkout = workout, let wc = wc else { return }
        
    }

}
