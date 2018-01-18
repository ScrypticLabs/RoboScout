//
//  SignUpInViewController.swift
//  RoboScout
//
//  Created by Abhi Gupta on 2015-03-08.
//  Copyright (c) 2015 AbhiGupta. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //@IBOutlet weak var message: UILabel!
    
    // Sign Up
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var region: UITextField!

    
    @IBAction func signUp(sender: AnyObject) {
        // Build the terms and conditions alert
        let alertController = UIAlertController(title: "Agree to terms and conditions",
            message: "Click I AGREE to signal that you agree to the End User Licence Agreement.",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alertController.addAction(UIAlertAction(title: "I AGREE",
            style: UIAlertActionStyle.Default,
            handler: { alertController in self.processSignUp()})
        )
        alertController.addAction(UIAlertAction(title: "I do NOT agree",
            style: UIAlertActionStyle.Default,
            handler: nil)
        )
        // Display alert
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func processSignUp() {
        var userEmailAddress = emailAddress.text
        var userPassword = password.text
        // Ensure username is lowercase
        userEmailAddress = userEmailAddress.lowercaseString
        // Start activity indicator
//        activityIndicator.hidden = false
//        activityIndicator.startAnimating()
        // Create the user
        var user = PFUser()
        user.username = userEmailAddress
        user.password = userPassword
        user.email = userEmailAddress
        user["Team"] = team.text
        user["Region"] = region.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("signUPInToNavigation", sender: self)
                }
            } else {
//                self.activityIndicator.stopAnimating()
//                
//                if let message: AnyObject = error!.userInfo!["error"] {
//                    self.message.text = "\(message)"
//                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //activityIndicator.hidden = true
        //activityIndicator.hidesWhenStopped = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
