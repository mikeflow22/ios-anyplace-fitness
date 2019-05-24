//
//  InstructorController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class InstructorController {
    var instructors: [Instructor] = [] {
        didSet {
            print("instructor array hit")
        }
    }
    
    var persistenceURL: URL? {
        let fileManger = FileManager.default
        guard let documentDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = documentDirectory.appendingPathComponent("instructors.plist")
        return fileName
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func instructorSignIn(instructor: Instructor) -> Bool {
        if instructors.contains(instructor) {
            return true
        }
        return false
    }
    
    func createInstructor(username: String, password: String, id: Int?, instructor: Bool) -> Instructor{
        let instructor = Instructor(username: username, password: password, id: id, instructor: instructor)
        instructors.append(instructor)
        saveToPersistentStore()
        print("this is the instructors array: \(instructors.map {$0.username})")
        return instructor
    }
    
    func update(instructor: Instructor, workouts: [Workout]?){
        instructor.workouts = workouts
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        guard let url = persistenceURL else {
            print("Error unwrapping url savingToPersistentStore for instructors")
            return }
        
        let propertyListEncoder = PropertyListEncoder()
        do {
            let data = try propertyListEncoder.encode(instructors)
            try data.write(to: url)
        } catch  {
            print("Error encoding instructors to persistent store: \(error.localizedDescription)")
            return
        }
    }
    
    func loadFromPersistentStore(){
        //we have to check to see if url path is there by checking the filemanager's file Exists method
        let fm = FileManager.default
        guard let url = persistenceURL, fm.fileExists(atPath: url.path) else { return }
        
        let propertyListDecoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            let instructors = try propertyListDecoder.decode([Instructor].self, from: data)
            self.instructors = instructors
        } catch  {
            print("Error decoding instructors data in the loadFromPersitenceStore do-catch: \(error.localizedDescription)")
            return
        }
    }
}
