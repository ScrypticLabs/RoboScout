//
//  DetailTeamViewController.swift
//  RoboScout
//
//  Created by Abhi Gupta on 2015-03-08.
//  Copyright (c) 2015 AbhiGupta. All rights reserved.
//

import UIKit

class DetailTeamViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var scrollView: UIScrollView!
    // Container to store the view table selected object
    var currentObject : PFObject?
//    var user = PFUser.currentUser()
    
    // View Modes
    @IBOutlet var viewBasic: UIView!
    @IBOutlet var viewAuto: UIView!
    @IBOutlet var viewTeleop: UIView!
    
    // Segmented Controller
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    //Defensive or Offensive
    @IBOutlet weak var RobotType: UIView!
    var robotType: String!
    
    // Basic text fields
    @IBOutlet weak var Team: UITextField!
    @IBOutlet weak var Region: UITextField!
    @IBOutlet weak var School: UITextField!
    @IBOutlet weak var MainStrategy: UITextView!
    @IBOutlet weak var Drivers: UITextField!
    @IBOutlet weak var Performance: UITextView!
    @IBOutlet weak var Sponsors: UITextView!
    @IBOutlet weak var Notes: UITextView!

    
    // Auto text fields
    @IBOutlet weak var LiftYellowTotes: UISegmentedControl!
    //@IBOutlet weak var LiftYellowTotes: UITextField!
    @IBOutlet weak var AmountItems: UITextField!
    @IBOutlet weak var AcquiredItems: UITextView!
    @IBOutlet weak var PersonalThoughtsAuto: UITextView!
    
    // TeleOp text fields
    @IBOutlet weak var WhatDoesItDoWithYellowContainer: UITextView!
    @IBOutlet weak var AmountLiftTotes: UITextField!
    @IBOutlet weak var ReceiveFromChute: UISegmentedControl!
    //@IBOutlet weak var ReceiveFromChute: UITextField!
    @IBOutlet weak var Time3ToteStack: UITextField!
    @IBOutlet weak var TimeContainers: UITextField!
    @IBOutlet weak var LiftUprightContainers: UISegmentedControl!
    //@IBOutlet weak var LiftUprightContainers: UITextField!
    @IBOutlet weak var LiftKnockedOverContainers: UISegmentedControl!
    //@IBOutlet weak var LiftKnockedOverContainers: UITextField!
    @IBOutlet weak var PersonalThoughts: UITextView!
    
    // The save button
    @IBAction func saveButton(sender: AnyObject) {
        // Unwrap the current object object
        if let updateObject = currentObject as PFObject? {
            // Basic objects
            updateObject["Team"] = Team.text
            updateObject["Region"] = Region.text
            updateObject["School"] = School.text
            updateObject["RobotType"] = robotType
            updateObject["MainStrategy"] = MainStrategy.text
            updateObject["Drivers"] = Drivers.text
            updateObject["Performance"] = Performance.text
            updateObject["Sponsors"] = Sponsors.text
            updateObject["Notes"] = Notes.text
            // Auto objects
            //var autoObject = PFObject(className: "Auto")  // use if need a second class to save info to
//            updateObject["LiftYellowTote"] = LiftYellowTotes.text
            updateObject["AmountOfItems"] = AmountItems.text
            updateObject["AcquiredItems"] = AcquiredItems.text
            updateObject["PersonalThoughts"] = PersonalThoughtsAuto.text
            // TeleOp Objects
            //var teleObject = PFObject(className: "TeleOp")
            updateObject["WhatDoesItDoWithYellowContainer"] = WhatDoesItDoWithYellowContainer.text
            updateObject["AmountTotes"] = AmountLiftTotes.text
//            updateObject["ReceiveFromChute"] = ReceiveFromChute.text
            updateObject["Time3ToteStack"] = Time3ToteStack.text
//            updateObject["UprightContainers"] = LiftUprightContainers.text
//            updateObject["KnockedOverContainers"] = LiftKnockedOverContainers.text
            updateObject["TimeContainers"] = TimeContainers.text
            updateObject["PersonalThoughts"] = PersonalThoughts.text
            // Save the data back to the server in a background task
            updateObject.saveEventually()
            //autoObject.saveEventually(nil)
            //teleObject.saveEventually(nil)
            // Save the data to your phone locally in a background task
            //object.pinInBackground()
            //autoObject.pinInBackground()
            //teleObject.pinInBackground()
            //OR DO THIS WHERE YOU MAKE A RELATIONAL OBJECT
            //autoObject["parent"] = object
            //teleObject["parent"] = object
            
        } else {
            
            // Create a new parse object
//            var updateObject = PFObject(className: "T"+(user.objectForKey("Team") as String))
            var updateObject = PFObject(className: "Basic")
            // Basic objects
            updateObject["Team"] = (Team.text != nil) ? Team.text: "Number"
            updateObject["Region"] = (Region.text != nil) ? Region.text: "City, Province"
            updateObject["School"] = (School.text != nil) ? School.text: "Eg: Honourable Vincent Massey Secondary"
//            updateObject["RobotType"] = robotType // not a string, but in server set as string data type
            updateObject["MainStrategy"] = (MainStrategy.text != nil) ? MainStrategy.text: "Try to thoroughly describe the team's strategy both for autonomous and tele-op mode. It shouldn't be obvious that you're recording their strategy . . ."
            updateObject["Drivers"] = (Drivers.text != nil) ? Drivers.text: "Amount"
            updateObject["Performance"] = (Performance.text != nil) ? Performance.text: "Describe how well the drivers perform. You can also include any tehniques that might be helpful and other equipment that may have been used to ease the drivers (i.e. cameras, OculusRift)"
            updateObject["Sponsors"] = (Sponsors.text != nil) ? Sponsors.text: "Write as many as you recognize"
            updateObject["Notes"] = (Notes.text != nil) ? Notes.text: "Programming - What was different about them?                    Mechanical - Specific designs that we should consider?                            Electrical - Different talons? Custom wiring?                                       Media / Public Relations - How did they promote the team?"
            // Auto objects
            //var autoObject = PFObject(className: "Auto")  // use if need a second class to save info to
            
//            updateObject["LiftYellowTote"] = (LiftYellowTotes.text != nil) ? LiftYellowTotes.text: "Yes / No"
            updateObject["AmountOfItems"] = (AmountItems.text != nil) ? AmountItems.text: "Amount"
            updateObject["AcquiredItems"] = (AcquiredItems.text != nil) ? AcquiredItems.text: "List these items . . ."
            updateObject["PersonalThoughts"] = (PersonalThoughtsAuto.text != nil) ? PersonalThoughtsAuto.text: "Is the autonomous mode the team's forté? How well did they perform in comparision to other challenges? Name some of their strengths and weaknesses."
            // TeleOp Objects
            //var teleObject = PFObject(className: "TeleOp")
            updateObject["WhatDoesItDoWithYellowContainer"] = (WhatDoesItDoWithYellowContainer.text != nil) ? WhatDoesItDoWithYellowContainer.text: "Explain the operations you observed the robot performing during the competition."
            updateObject["AmountTotes"] = (AmountLiftTotes.text != nil) ? AmountLiftTotes.text: "Amount"
//            updateObject["ReceiveFromChute"] = (ReceiveFromChute.text != nil) ? ReceiveFromChute.text: "Yes/ No"
            updateObject["Time3ToteStack"] = (Time3ToteStack.text != nil) ? Time3ToteStack.text: "Time"
//            updateObject["UprightContainers"] = (LiftUprightContainers.text != nil) ? LiftUprightContainers.text: "Yes / No"
//            updateObject["KnockedOverContainers"] = (LiftKnockedOverContainers.text != nil) ? LiftKnockedOverContainers.text: "Yes / No"
            updateObject["TimeContainers"] = (TimeContainers.text != nil) ? TimeContainers.text: "Time"
            updateObject["PersonalThoughts"] = (PersonalThoughts.text != nil) ? PersonalThoughts.text: "Is the tele-operator mode the team's forté? How well did they perform in comparision to other challenges? Name some of their strengths and weaknesses."
            
            updateObject.ACL = PFACL(user: PFUser.currentUser())
            // Save the data back to the server in a background task
            updateObject.saveEventually()
        }
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // Not working right now
    @IBAction func robotTypeIndicator(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            robotType = "Defensive"
        }
        if sender.selectedSegmentIndex == 1 {
            robotType = "Offensive"
        }
    }
    
    // The segmented control action
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            println("Basic")
            self.viewBasic.hidden = false
            self.viewAuto.hidden = true
            self.viewTeleop.hidden = true
        }
        if sender.selectedSegmentIndex == 1 {
            println("Auto")
            self.viewBasic.hidden = true
            self.viewAuto.hidden = false
            self.viewTeleop.hidden = true
        }
        if sender.selectedSegmentIndex == 2 {
            println("Teleop")
            self.viewBasic.hidden = true
            self.viewAuto.hidden = true
            self.viewTeleop.hidden = false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView.contentSize.height = 1000
        // Unwrap the current object object
        if let object = currentObject? {
            // Basic Information
            Team.text = (object["Team"] != nil) ? object["Team"] as String: "Number"          // ternary operators -- rock!
            
            if object["Team"] as NSString != "Number" {
                self.title = Team.text
            } else {
                self.title = nil
            }
            
            Region.text = (object["Region"] != nil) ? object["Region"] as String: "City, Province"
            School.text = (object["School"] != nil) ? object["School"] as String: "Eg: Honourable Vincent Massey Secondary"
            robotType = (object["RobotType"] != nil) ? object["RobotType"] as String: ""    // doesnt work
            MainStrategy.text = (object["MainStrategy"] != nil) ? object["MainStrategy"] as String: "Try to thoroughly describe the team's strategy both for autonomous and tele-op mode. It shouldn't be obvious that you're recording their strategy . . ."
            Drivers.text = (object["Drivers"] != nil) ? object["Drivers"] as String: "Amount"
            Performance.text = (object["Performance"] != nil) ? object["Performance"] as String: "Describe how well the drivers perform. You can also include any tehniques that might be helpful and other equipment that may have been used to ease the drivers (i.e. cameras, OculusRift)"
            Sponsors.text = (object["Sponsors"] != nil) ? object["Sponsors"] as String: "Write as many as you recognize"
            Notes.text = (object["Notes"] != nil) ? object["Notes"] as String: "Programming - What was different about them?                    Mechanical - Specific designs that we should consider?                            Electrical - Different talons? Custom wiring?                                       Media / Public Relations - How did they promote the team?"

            // AutoMode Information
            //var autoObject = PFObject(className: "Auto") use if want to get data from second class
//            LiftYellowTotes.text = (object["LiftYellowTote"] != nil) ? object["LiftYellowTote"] as String: "Yes / No"
            AmountItems.text = (object["AmountOfItems"] != nil) ? object["AmountOfItems"] as String: "Amount"
            AcquiredItems.text = (object["AcquiredItems"] != nil) ? object["AcquiredItems"] as String: "List these items . . ."
            PersonalThoughtsAuto.text = (object["PersonalThoughtsAuto"] != nil) ? object["PersonalThoughtsAuto"] as String: "Is the autonomous mode the team's forté? How well did they perform in comparision to other challenges? Name some of their strengths and weaknesses."
            
            // TeleOp Information
            //var teleObject = PFObject(className: "TeleOp")
            WhatDoesItDoWithYellowContainer.text = (object["WhatDoesItDoWithYellowContainer"] != nil) ? object["WhatDoesItDoWithYellowContainer"] as String: "Explain the operations you observed the robot performing during the competition."
            AmountLiftTotes.text = (object["AmountTotes"] != nil) ? object["AmountTotes"] as String: "Amount"
 //           ReceiveFromChute.text = (object["ReceiveFromChute"] != nil) ? object["ReceiveFromChute"] as String: "Yes / No"
            Time3ToteStack.text = (object["Time3ToteStack"] != nil) ? object["Time3ToteStack"] as String: "Time"
 //           LiftUprightContainers.text = (object["UprightContainers"] != nil) ? object["UprightContainers"] as String: "Yes / No"
 //           LiftKnockedOverContainers.text = (object["KnockedOverContainers"] != nil) ? object["KnockedOverContainers"] as String: "Yes / No"
            TimeContainers.text = (object["TimeContainers"] != nil) ? object["TimeContainers"] as String: "Time"
            PersonalThoughts.text = (object["PersonalThoughtsTele"] != nil) ? object["PersonalThoughtsTele"] as String: "Is the tele-operator mode the team's forté? How well did they perform in comparision to other challenges? Name some of their strengths and weaknesses."
        } else {
            // Basic Information
//            var object = PFObject(className: "T"+(user.objectForKey("Team") as String))
            var object = PFObject(className: "Basic")

//            Team.text = (object["Team"] != nil) ? object["Team"] as String: "Number"          // ternary operators -- rock!
//            
//            if object["Team"] as NSString != "Number" {
//                self.title = Team.text
//            } else {
//                self.title = nil
//            }
            
//            Region.text = (object["Region"] != nil) ? object["Region"] as String: "City, Province"
            School.text = (object["School"] != nil) ? object["School"] as String: "Eg: Honourable Vincent Massey Secondary"
            robotType = (object["RobotType"] != nil) ? object["RobotType"] as String: ""    // doesnt work
            MainStrategy.text = (object["MainStrategy"] != nil) ? object["MainStrategy"] as String: "Try to thoroughly describe the team's strategy both for autonomous and tele-op mode. It shouldn't be obvious that you're recording their strategy . . ."
            Drivers.text = (object["Drivers"] != nil) ? object["Drivers"] as String: "Amount"
            Performance.text = (object["Performance"] != nil) ? object["Performance"] as String: "Describe how well the drivers perform. You can also include any tehniques that might be helpful and other equipment that may have been used to ease the drivers (i.e. cameras, OculusRift)"
            Sponsors.text = (object["Sponsors"] != nil) ? object["Sponsors"] as String: "Write as many as you recognize"
            Notes.text = (object["Notes"] != nil) ? object["Notes"] as String: "Programming - What was different about them?                    Mechanical - Specific designs that we should consider?                            Electrical - Different talons? Custom wiring?                                       Media / Public Relations - How did they promote the team?"
            
            // AutoMode Information
            //var autoObject = PFObject(className: "Auto") use if want to get data from second class
//            LiftYellowTotes.text = (object["LiftYellowTote"] != nil) ? object["LiftYellowTote"] as String: "Yes / No"
            AmountItems.text = (object["AmountOfItems"] != nil) ? object["AmountOfItems"] as String: "Amount"
            AcquiredItems.text = (object["AcquiredItems"] != nil) ? object["AcquiredItems"] as String: "List these items . . ."
            PersonalThoughtsAuto.text = (object["PersonalThoughtsAuto"] != nil) ? object["PersonalThoughtsAuto"] as String: "Is the autonomous mode the team's forté? How well did they perform in comparision to other challenges? Name some of their strengths and weaknesses."
            
            // TeleOp Information
            //var teleObject = PFObject(className: "TeleOp")
            WhatDoesItDoWithYellowContainer.text = (object["WhatDoesItDoWithYellowContainer"] != nil) ? object["WhatDoesItDoWithYellowContainer"] as String: "Explain the operations you observed the robot performing during the competition."
            AmountLiftTotes.text = (object["AmountTotes"] != nil) ? object["AmountTotes"] as String: "Amount"
//            ReceiveFromChute.text = (object["ReceiveFromChute"] != nil) ? object["ReceiveFromChute"] as String: "Yes / No"
            Time3ToteStack.text = (object["Time3ToteStack"] != nil) ? object["Time3ToteStack"] as String: "Time"
//            LiftUprightContainers.text = (object["UprightContainers"] != nil) ? object["UprightContainers"] as String: "Yes / No"
//            LiftKnockedOverContainers.text = (object["KnockedOverContainers"] != nil) ? object["KnockedOverContainers"] as String: "Yes / No"
            TimeContainers.text = (object["TimeContainers"] != nil) ? object["TimeContainers"] as String: "Time"
            PersonalThoughts.text = (object["PersonalThoughtsTele"] != nil) ? object["PersonalThoughtsTele"] as String: "Is the tele-operator mode the team's forté? How well did they perform in comparision to other challenges? Name some of their strengths and weaknesses."

        
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
