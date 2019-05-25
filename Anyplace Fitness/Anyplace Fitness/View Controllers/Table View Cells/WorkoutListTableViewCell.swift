//
//  WorkoutListTableViewCell.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class WorkoutListTableViewCell: UITableViewCell {

//only need the workout because we already checked if it ws the client workout or instruxtor before we passed it in here.
    
    var workout: Workout? {
        didSet{
            print("WorkoutListTableViewCell workout was set")
        updateViews()
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    //We are going to load the cell in the table view controller cellForAtRow
    func updateViews(){
        guard let passedInWorkout = workout else {
            print("WorkoutListTableViewCell ERRRORRORRORROR")
            return }
        workoutNameLabel.text = passedInWorkout.name
        dayLabel.text = passedInWorkout.schedule
//        myImageView.image = UIImage(named: image)

    }
}
