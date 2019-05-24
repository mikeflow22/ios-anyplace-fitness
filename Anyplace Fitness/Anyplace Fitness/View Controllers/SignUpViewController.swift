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
    
    func updateViewsForSegmented(){
        //if signedIn pressed change views
        
        //if signUp pressed, change views
    }
    
    func signUp(){
        
    }
    
    func signIn(){
        guard let username = usernameTF.text, !username.isEmpty, let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else  { return }
        //check the username and password against both clients and instructors
        if cc.clientSignIn(username: username, password: password){
            //if this is true the client has signed in before
        } else {
            //client has not signed in before so create an alert message and tell them to sign up
        }
    }
}
