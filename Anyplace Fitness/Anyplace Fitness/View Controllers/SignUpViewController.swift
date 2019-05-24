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
    var client: Client? {
        didSet {
            print("client set on sign in page")
        }
    }
    var instructor: Instructor? {
        didSet {
            print("instructor set on sign in page")
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var switchProperties: UISwitch!
    @IBOutlet weak var segmentedProperties: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if segmentedProperties.selectedSegmentIndex == 0 {
            segmentedProperties.selectedSegmentIndex = 1
        } else {
            segmentedProperties.selectedSegmentIndex = 0
        }
    }
    
    //MARK: - IBActions
    @IBAction func switchValuechanged(_ sender: UISwitch) { //DONT NEED THIS GET RIDE OF IT
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        print("button value changed")
        guard let username = usernameTF.text, !username.isEmpty, let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else  { return }
        
//        let client = cc.createClient(username: username, password: password)
//        let instructor = ic.createInstructor(username: username, password: password, id: nil, instructor: switchProperties.isOn)
        
        //if sign up create either a client or instructor based on the switch value.
        if sender.selectedSegmentIndex == 1 && !switchProperties.isOn {
            //client is signing UP
            self.client = cc.createClient(username: username, password: password)
            //segue and change side
            isClientSide = true
            
            performSegue(withIdentifier: "SignUpSegue", sender: self)
            
        } else if sender.selectedSegmentIndex == 1 && switchProperties.isOn {
            //instructor signing up
            self.instructor = ic.createInstructor(username: username, password: password, id: nil, instructor: switchProperties.isOn)
            //segue and update side
            isClientSide = false
            performSegue(withIdentifier: "SignUpSegue", sender: self)
            
        } else if sender.selectedSegmentIndex == 0 && !switchProperties.isOn {
            //client signing back in
            guard let signInClient = client else { return }
            if cc.clientSignIn(client: signInClient){
                //if this is true then segue and change side
                isClientSide = true
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            } else  {
                //ALERT MESSAGE SAYING SIGN UP
                alert(message: "You are not in our database, please sign UP.")
            }
        } else if sender.selectedSegmentIndex == 0 && switchProperties.isOn {
            //instructor signing back in
            guard let signInInstructor = instructor else { return }
            if ic.instructorSignIn(instructor: signInInstructor){
                //if this is true then segue and update side
                isClientSide = false
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            } else {
                //ALERT MESSAGE SAYING SIGN UP
                alert(message: "You are not in our database, please sign UP.")
            }
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
