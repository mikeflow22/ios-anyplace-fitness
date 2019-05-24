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
    @IBAction func switchValuechanged(_ sender: UISwitch) {
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        guard let username = usernameTF.text, !username.isEmpty, let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else  { return }
        
        //if sign up create either a client or instructor based on the switch value.
        
        if sender.selectedSegmentIndex == 0 && !switchProperties.isOn {
            //client signing back in
            if cc.clientSignIn(username: username, password: password){
                //if this is true then segue and change side
                isClientSide = true
            } else {
                //ALERT MESSAGE SAYING SIGN UP
            }
        } else if sender.selectedSegmentIndex == 0 && switchProperties.isOn {
            //instructor signing back in
            if ic.instructorSignIn(username: username, password: password, instructor: switchProperties.isOn){
                //if this is true then segue and update side
                isClientSide = false
            } else {
                //ALERT MESSAGE SAYING SIGN UP
            }
            
        } else if sender.selectedSegmentIndex == 1 && !switchProperties.isOn {
            //client is signing UP
            cc.createClient(username: username, password: password)
            //segue and change side
            isClientSide = true
        } else if sender.selectedSegmentIndex == 1 && switchProperties.isOn {
            //instructor signing up
            ic.createInstructor(username: username, password: password, id: nil, instructor: switchProperties.isOn)
            //segue and update side
            isClientSide = false
        }
    }
    
    //need to add button to check segmented and textfields
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
