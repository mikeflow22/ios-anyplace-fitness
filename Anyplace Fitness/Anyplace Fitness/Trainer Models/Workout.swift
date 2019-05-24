//
//  Workout.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class Workout: Codable {
    var name: String
    var schedule: String
    var location: String
    var instructorName: String
    
    //optional properties
    let id: Int?
    let username: String?
    var image: String?
    var punchPass: [PunchPass]?
    var clients: [Client]?
    
    init(name: String, schedule: String, location: String, id: Int? = nil, username: String? = nil, image: String? = nil, instructorName: String, punchPass: [PunchPass]? = nil, clients: [Client]? = nil) {
        self.name = name
        self.schedule = schedule
        self.location = location
        self.id = id
        self.username = username
        self.image = image
        self.instructorName = instructorName
        self.punchPass = punchPass
        self.clients = clients
    }
}

extension Workout: Equatable {
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.name == rhs.name && lhs.schedule == rhs.schedule && lhs.location == rhs.location && lhs.instructorName == rhs.instructorName && lhs.clients == rhs.clients
    }
}
