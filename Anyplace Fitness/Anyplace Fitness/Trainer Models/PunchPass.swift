//
//  PunchPass.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class PunchPass: Codable {
    var day: Int
    var price: Double
    var isSet: Bool
    
    init(day: Int, price: Double, isSet: Bool) {
        self.day = day
        self.price = price
        self.isSet = isSet
    }
}
extension PunchPass: Equatable {
    static func == (lhs: PunchPass, rhs: PunchPass) -> Bool {
        return lhs.day == rhs.day && lhs.price == rhs.price && lhs.isSet == rhs.isSet
    }
    
    
}
