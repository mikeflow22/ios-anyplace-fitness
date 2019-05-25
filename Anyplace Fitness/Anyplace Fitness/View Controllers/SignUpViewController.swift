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
        print("client array: \(cc.clients.map { $0.username})")
        print("instructors array: \(ic.instructors.map { $0.username})")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        cc.clients.removeAll()
////        ic.instructors.removeAll()
//        print("client array: \(cc.clients.map { $0.username})")
//        print("instructors array: \(ic.instructors.map { $0.username})")
        
        if segmentedProperties.selectedSegmentIndex == 0 {
            segmentedProperties.selectedSegmentIndex = 1
        } else {
            segmentedProperties.selectedSegmentIndex = 0
        }
        print(segmentedProperties.selectedSegmentIndex)
        
        
    }
    
    //MARK: - IBActions
    @IBAction func switchValuechanged(_ sender: UISwitch) { //DONT NEED THIS GET RIDE OF IT
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        print("button value changed")
        guard let username = usernameTF.text, !username.isEmpty, let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else  { return }
        
        //if sign up create either a client or instructor based on the switch value.
        if sender.selectedSegmentIndex == 1 && !switchProperties.isOn {
            //client is signing UP
            print("client is signing up.")
            
            if cc.clientSignIn(username: username, password: password){
                //if the credentials are already in the array, then client has previously signed up and should not be able to sign in again. create an alert
                alert(message: "YOU HAVE ALREADY SIGNED UP, PLEASE SIGN IN.")
            } else {
                //first time this user is signing up, so create client to append the array
                self.client = cc.createClient(username: username, password: password)
                //segue
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            }
        } else if sender.selectedSegmentIndex == 1 && switchProperties.isOn {
            //instructor signing up
            print("INSTRUCTOR IS SIGNING UP")
            
            //check to see if instructor is already in the array, if so then they've already signed up so they cannot do it twice, show an alert
            if ic.instructorSignIn(instructor: Instructor(username: username, password: password, instructor: switchProperties.isOn)){
            } else {
                self.instructor = ic.createInstructor(username: username, password: password, id: nil, instructor: switchProperties.isOn)
                //segue
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            }
        } else if sender.selectedSegmentIndex == 0 && !switchProperties.isOn {
            //client signing back in
            print("CLIENT SIGNING BACK IN")
           
            if cc.clientSignIn(username: username, password: password){
                
                //so we know its in the array so we can set the client here with the credentials
                self.client = Client(username: username, password: password)
                print("CLIENT SIGN BACK IN SUCCESS!!!!!!!!!!!!!!!!!!!!!!")
                //segue
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            } else  {
                //ALERT MESSAGE SAYING SIGN UP IF NO IN ARRAY THEN THEY SHOULDNT BE TRYING TO SIGN IN BUT RATHER SIGNING UP
                alert(message: "You are not in our database, please sign UP.")
            }
        } else if sender.selectedSegmentIndex == 0 && switchProperties.isOn {
            //instructor signing back in
            print("INSTRUCTOR SIGNING BACK IN")
            //If credentials are in the array, then they've already signed up, so they are allowed to sign back in.
            if ic.instructorSignIn(instructor: Instructor(username: username, password: password, instructor: switchProperties.isOn)){
                //if this is true then segue and update side
                print("INSTRUCTOR SIGN IN SUCCESS")
                self.instructor = Instructor(username: username, password: password, instructor: switchProperties.isOn)
                performSegue(withIdentifier: "SignUpSegue", sender: self)
            } else {
                //ALERT MESSAGE SAYING SIGN UP. After we checked the array and didn't find the credentials in it, we are goig to tell them to sign UP
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
            
            if let clientToPass = client {
                destinationVC.client = clientToPass
            }
            if let instructorToPass = instructor {
                destinationVC.instructor = instructorToPass
            }
        }
    }
}
