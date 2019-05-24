//
//  Workout.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class Workout: Codable {
    let name: String
    let schedule: String
    let location: String
    
    //optional properties
    let id: Int?
    let username: String?
    let image: String?
    let instructorId: Int?
    let punchPass: [PunchPass]?
    let clients: [Client]?
    
    init(name: String, schedule: String, location: String, id: Int? = nil, username: String? = nil, image: String? = nil, instructorId: Int? = nil, punchPass: [PunchPass]? = nil, clients: [Client]? = nil) {
        self.name = name
        self.schedule = schedule
        self.location = location
        self.id = id
        self.username = username
        self.image = image
        self.instructorId = instructorId
        self.punchPass = punchPass
        self.clients = clients
    }
}

extension Workout: Equatable {
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.name == rhs.name && lhs.schedule == rhs.schedule && lhs.location == rhs.location && lhs.instructorId == rhs.instructorId && lhs.clients == rhs.clients
    }
}
