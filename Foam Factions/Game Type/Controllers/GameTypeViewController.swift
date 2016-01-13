//
//  GameTypeViewController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/8/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import Parse

class GameTypeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let gameTypeTable = UITableView()
  var gameList = [PFObject]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Game Types"
    
    getGameTypes()
    
    initializeAdd()
    
    self.view.backgroundColor = UIColor.whiteColor()
  }

  func initializeAdd() {
    let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addButtonPressed:")
    self.navigationItem.setRightBarButtonItem(addButton, animated: true)
  }
  
  func addButtonPressed(sender:UIBarButtonItem!) {
    let creationVC = GameTypeCreationViewController()
    self.navigationController?.pushViewController(creationVC, animated: true)
  }
  
  func getGameTypes() {
    let query = PFQuery(className:"Game")
    query.findObjectsInBackgroundWithBlock {
      (objects: [PFObject]?, error: NSError?) -> Void in
      
      if error == nil {
        if let objects = objects {
          for object in objects {
            let approved = object["approved"] as! Bool
            if approved {
              self.gameList.append(object)
            }
          }
          self.initializeGameTypeTable()
        }
      } else {
        // Log details of the failure
        print("Error: \(error!) \(error!.userInfo)")
      }
    }
  }
  
  // MARK: TableView
  
  func initializeGameTypeTable() {
    gameTypeTable.dataSource = self
    gameTypeTable.delegate = self
    self.view.addSubview(gameTypeTable)
    
    gameTypeTable.snp_makeConstraints { (make) -> Void in
      make.left.right.top.bottom.equalTo(self.view)
    }
  }
  
  func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
    return self.gameList.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "GameCell")
    
    cell.textLabel?.textColor = UIColor.darkGrayColor()
    cell.detailTextLabel?.textColor = UIColor.darkGrayColor()
    cell.accessoryType = .DisclosureIndicator
    
    if self.gameList.count >= indexPath.row {
      let game = self.gameList[indexPath.row]
      let groupTitle = game["gameTitle"] as! String
      let location = game["category"] as! String
      
      cell.textLabel?.text = "\(groupTitle)"
      cell.detailTextLabel!.text = "\(location)"
    }
    
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let gameTypeDetailsVC = GameTypeDetailsViewController()
    gameTypeDetailsVC.passedData = self.gameList[indexPath.row]
    self.navigationController?.pushViewController(gameTypeDetailsVC, animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
