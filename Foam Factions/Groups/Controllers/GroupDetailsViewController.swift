//
//  GroupDetailsViewController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/12/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import Parse

class GroupDetailsViewController: UIViewController {

  @IBOutlet weak var groupTitle: UILabel!
  @IBOutlet weak var groupMemberCount: UILabel!
  @IBOutlet weak var groupAddress: UILabel!
  
  var passedData = PFObject?()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Group Details"
    
    setupGroup()
  }

  func setupGroup() {
    
    let displayTitle = (passedData!["groupTitle"] as? String)
    groupTitle.text = displayTitle
    
    let memberArray = passedData!["groupMembers"] as! Array<String> as Array
    groupMemberCount.text = String(format: "%d %@", memberArray.count, memberArray.count == 1 ? "member" : "members")
    
    let displayAddress = String(format: "%@ %@ %@", (passedData!["address"] as? String)!,
      (passedData!["location"] as? String)!, (passedData!["zipCode"] as? String)!)
    
    groupAddress.text = displayAddress
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
