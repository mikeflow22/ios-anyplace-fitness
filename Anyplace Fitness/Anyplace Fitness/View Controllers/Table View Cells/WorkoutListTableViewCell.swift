//
//  WorkoutListTableViewCell.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class WorkoutListTableViewCell: UITableViewCell {

//    var wc: WorkoutController?
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
    
    //MARK: - IBOutlets
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    

}
