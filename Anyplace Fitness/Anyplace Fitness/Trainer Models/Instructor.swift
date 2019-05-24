//
//  Instructor.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class Instructor: Codable {
    //does everything below here have to be on the api documentation for parsing purposes?
    
    var username: String
    var password: String
    var id: Int?
    let instructor: Bool
    var workouts: [Workout]?
    
    init(username: String, password: String, id: Int? = nil, instructor: Bool, workouts: [Workout]? = nil) {
        self.username = username
        self.password = password
        self.id = id
        self.instructor = instructor
        self.workouts = workouts
    }
    
    
}
