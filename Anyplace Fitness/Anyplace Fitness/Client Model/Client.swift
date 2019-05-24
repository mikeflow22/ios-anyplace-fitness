//
//  Client.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class Client: Codable {
    let username: String
    let password: String
    
    //optional properties
    let instructor: Bool?
    var workouts: [Workout]?
    var passes: [PunchPass]?
    var id: Int?
    var usesRemaining: Int?
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case instructor
        case workouts
        case passes
        case id
        case usesRemaining = "uses_remaining"
    }
    
    init(username: String, password: String, instructor: Bool = false, workouts: [Workout]? = nil, passes: [PunchPass]? = nil, id: Int? = nil, usesRemaining: Int? = nil){
        self.username = username
        self.password = password
        self.instructor = instructor
        self.workouts = workouts
        self.passes = passes
        self.id = id
        self.usesRemaining = usesRemaining
    }
}

extension Client: Equatable {
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.username == rhs.username && lhs.password == rhs.password && lhs.workouts == rhs.workouts && lhs.instructor == rhs.instructor
    }
}
