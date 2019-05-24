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
        didSet {
            updateViews()
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    func updateViews(){
        guard let passedInWorkout = workout, let image = passedInWorkout.image else { return }
        workoutNameLabel.text = passedInWorkout.name
        dayLabel.text = passedInWorkout.schedule
        myImageView.image = UIImage(named: image)

    }
}
