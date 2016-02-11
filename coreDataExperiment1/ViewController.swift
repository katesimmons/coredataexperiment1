//
//  ViewController.swift
//  coreDataExperiment1
//
//  Created by Kate Simmons on 2/10/16.
//  Copyright © 2016 Kate Simmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "The List"
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addName(sender: AnyObject) {
        
        //create popup
        let alert = UIAlertController(title: "New Name", message: "Add a name", preferredStyle: .Alert)
        
        //cancel Method
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        //save method
        let saveAction = UIAlertAction(title: "Save",
            style: .Default) { (action: UIAlertAction) -> Void in
            
                let textField = alert.textFields!.first
                self.names.append(textField!.text!)
                self.tableView.reloadData()
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    //stopped at 20:13 in screen recordinger -- getting an App Delegate error that doesn't make sense
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel!.text = names[indexPath.row]
        return cell!
        
    }
    

}

