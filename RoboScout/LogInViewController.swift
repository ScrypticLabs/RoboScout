//
//  LogInViewController.swift
//  RoboScout
//
//  Created by Abhi Gupta on 2015-03-08.
//  Copyright (c) 2015 AbhiGupta. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // Log In objects
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //@IBOutlet weak var message: UILabel!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn(sender: AnyObject) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var userEmailAddress = emailAddress.text
        userEmailAddress = userEmailAddress.lowercaseString
        
        var userPassword = password.text
        
        PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("logInToNavigation", sender: self)
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    //self.message.text = "\(message)"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
