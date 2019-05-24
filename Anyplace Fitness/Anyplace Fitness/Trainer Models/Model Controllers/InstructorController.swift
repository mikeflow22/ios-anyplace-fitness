//
//  InstructorController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class InstructorController {
    var instructors: [Instructor] = []
    
    func createInstructor(username: String, password: String, id: Int?, instructor: Bool){
        let instructor = Instructor(username: username, password: password, id: id, instructor: instructor)
        instructors.append(instructor)
    }
}
