//
//  GroupsViewController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/8/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import Parse

class GroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let groupTable = UITableView()
  var groupList = [PFObject]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Groups"
    self.view.backgroundColor = UIColor.whiteColor()
    
    getGroups()
    initializeAdd()
  }

  func initializeAdd() {
    let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addButtonPressed:")
    self.navigationItem.setRightBarButtonItem(addButton, animated: true)
  }
  
  func addButtonPressed(sender:UIBarButtonItem!) {
    print("Add Pressed")
  }
  
  func getGroups() {
    let query = PFQuery(className:"Group")
    query.findObjectsInBackgroundWithBlock {
      (objects: [PFObject]?, error: NSError?) -> Void in
      
      if error == nil {
        if let objects = objects {
          for object in objects {
            let publicGroup = object["publicGroup"] as! Bool
            if publicGroup {              
              self.groupList.append(object)
            }
          }
          self.initializeGroupTable()
        }
      } else {
        // Log details of the failure
        print("Error: \(error!) \(error!.userInfo)")
      }
    }
  }
  
  // MARK: Setup Table
  
  func initializeGroupTable() {
    groupTable.dataSource = self
    groupTable.delegate = self
    self.view.addSubview(groupTable)
    
    groupTable.snp_makeConstraints { (make) -> Void in
      make.left.right.top.bottom.equalTo(self.view)
    }
  }
  
  func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
    return self.groupList.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "GroupCell")
    
    cell.textLabel?.textColor = UIColor.darkGrayColor()
    cell.detailTextLabel?.textColor = UIColor.darkGrayColor()
    cell.accessoryType = .DisclosureIndicator
    
    if self.groupList.count >= indexPath.row {
      let group = self.groupList[indexPath.row]
      let groupTitle = group["groupTitle"] as! String
      let location = group["location"] as! String

      cell.textLabel?.text = "\(groupTitle)"
      cell.detailTextLabel!.text = "\(location)"
    }

    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let groupDetailsVC = GroupDetailsViewController()
    groupDetailsVC.passedData = self.groupList[indexPath.row]
    self.navigationController?.pushViewController(groupDetailsVC, animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
