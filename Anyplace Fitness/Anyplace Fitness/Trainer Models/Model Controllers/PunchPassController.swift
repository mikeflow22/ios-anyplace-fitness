//
//  PunchPassController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class PunchPassController {
    var passes = [PunchPass]()
    
    //CREATE MOCK DATA IN THE INIT
    
    func createPass(day: Int, price: Double, isSet: Bool){
        let newPass = PunchPass(day: day, price: price, isSet: isSet)
        passes.append(newPass)
        
        //SAVE TO PERSISTENT STORE
    }
    
    func update(punchPass: PunchPass, newDay: Int, newPrice: Double, isSet: Bool){
        punchPass.day = newDay
        punchPass.price = newPrice
        punchPass.isSet = isSet
        
        //SAVE TO PERSISTENT STORE
    }
}
