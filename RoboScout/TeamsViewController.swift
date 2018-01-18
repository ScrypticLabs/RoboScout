//
//  TeamsViewController.swift
//  RoboScout
//
//  Created by Abhi Gupta on 2015-03-08.
//  Copyright (c) 2015 AbhiGupta. All rights reserved.
//

import UIKit

class TeamsViewController: PFQueryTableViewController {
//    var user = PFUser.currentUser()
    // Sign the user out
    @IBAction func signOut(sender: AnyObject) {
        PFUser.logOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LogInViewController") as UIViewController
        vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        vc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    // Initialise the PFQueryTable tableview
    override init!(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Configure the PFQueryTableView
//        self.parseClassName = "T"+(user.objectForKey("Team") as String)// ("T" + (user["Team"] as String)))
        self.parseClassName = "Basic"
        print(self.parseClassName)
        self.textKey = "Team"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery! {
//        var query = PFQuery(className: ("T"+(user.objectForKey("Team") as String)))
        var query = PFQuery(className: "Basic")
        query.orderByAscending("Team")
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        // Extract values from the PFObject to display in the table cell
        if object["Team"] as NSString != "Name" {
            cell?.textLabel?.text = object["Team"] as String!
        } else {
            cell?.textLabel?.text = nil
        }
        
        if object["Region"] != nil {
            if object["Region"] as NSString != "City, Province" && object["Region"] as NSString != "Subtitle" {
                cell?.detailTextLabel?.text = object["Region"] as String!
            }
        } else {
            cell?.detailTextLabel?.text = nil
        }
        
        return cell
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        if segue.identifier != "TeamsViewtoMenuView" {
            var detailScene = segue.destinationViewController as DetailTeamViewController
            // Pass the selected object to the destination view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let row = Int(indexPath.row)
                detailScene.currentObject = objects[row] as? PFObject
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // Refresh the table to ensure any data changes are displayed
        tableView.reloadData()

    }
    
    // add more teams
    @IBAction func add(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("TeamsViewToDetailView", sender: self)
        }
    }
    
}
