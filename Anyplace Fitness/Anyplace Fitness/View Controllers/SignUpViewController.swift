//
//  SignUpViewController.swift
//  Anyplace Fitness
//
//  Created by Michael Flowers on 5/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit
//ON BOARD NEW CLIENT -- fetch clients
//ON BOARD TRAINER -- fetch instructors
class SignUpViewController: UIViewController {
    //THIS IS WHAT WE WILL PASS TO MAKE SURE THE CORRECT SIDE IS SHOWING
    var isClientSide = false
    
    //maybe these should go in the viewDidLoad?
    let cc = ClientController()
    let ic = InstructorController()
    var client: Client?
    var instructor: Instructor?
    
    //MARK: - IBOutlets
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var switchProperties: UISwitch!
    @IBOutlet weak var segmentedProperties: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func switchValuechanged(_ sender: UISwitch) { //DONT NEED THIS GET RIDE OF IT
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        guard let username = usernameTF.text, !username.isEmpty, let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else  { return }
        
        let client = cc.createClient(username: username, password: password)
        let instructor = ic.createInstructor(username: username, password: password, id: nil, instructor: switchProperties.isOn)
        
        //if sign up create either a client or instructor based on the switch value.
        
        if sender.selectedSegmentIndex == 0 && !switchProperties.isOn {
            //client signing back in
            if cc.clientSignIn(client: client){
                //if this is true then segue and change side
                isClientSide = true
                self.client = client
            } else {
                //ALERT MESSAGE SAYING SIGN UP
                alert(message: "You are not in our database, please sign UP.")
            }
        } else if sender.selectedSegmentIndex == 0 && switchProperties.isOn {
            //instructor signing back in
            if ic.instructorSignIn(instructor: instructor){
                //if this is true then segue and update side
                isClientSide = false
                self.instructor = instructor
            } else {
                //ALERT MESSAGE SAYING SIGN UP
                alert(message: "You are not in our database, please sign UP.")
            }
        } else if sender.selectedSegmentIndex == 1 && !switchProperties.isOn {
            //client is signing UP
            let client = cc.createClient(username: username, password: password)
            //segue and change side
            isClientSide = true
            self.client = client
        } else if sender.selectedSegmentIndex == 1 && switchProperties.isOn {
            //instructor signing up
            let instructor = ic.createInstructor(username: username, password: password, id: nil, instructor: switchProperties.isOn)
            //segue and update side
            isClientSide = false
            self.instructor = instructor
        }
    }
    
    func alert(message: String){
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpSegue" {
            //pass over the value of isClientSide
            guard let destinationVC = segue.destination as? WorkoutListTableViewController else { return }
            destinationVC.isClientSide = isClientSide
            destinationVC.client = client
            destinationVC.instructor = instructor
        }
    }
}
