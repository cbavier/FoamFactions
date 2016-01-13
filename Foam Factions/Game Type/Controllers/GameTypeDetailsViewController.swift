//
//  GameTypeDetailsViewController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/12/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import Parse

class GameTypeDetailsViewController: UIViewController {

  var passedData = PFObject?()
  
  lazy var gameTitle = UILabel()
  lazy var gameCategory = UILabel()
  lazy var goal = UILabel()
  lazy var rules = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Description"

    initializeView()
  }
    
  func initializeView() {
    self.view.backgroundColor = UIColor.whiteColor()
    
    // Game Title
    gameTitle.text = passedData!["gameTitle"] as? String
    gameTitle.textColor = UIColor.darkGrayColor()
    gameTitle.font = UIFont.boldSystemFontOfSize(22)
    self.view.addSubview(gameTitle)
    
    gameTitle.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(self.view).offset(16)
      make.width.equalTo(self.view).offset(-32)
      make.centerX.equalTo(self.view)
    }
    
    // Game Category
    gameCategory.text = passedData!["category"] as? String
    gameCategory.textColor = UIColor.darkGrayColor()
    gameCategory.font = UIFont.systemFontOfSize(16)
    self.view.addSubview(gameCategory)
    
    gameCategory.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(gameTitle.snp_bottom).offset(8)
      make.width.equalTo(gameTitle)
      make.centerX.equalTo(self.view)
    }
    
    // Game Goal
    goal.text = passedData!["goal"] as? String
    goal.textColor = UIColor.darkGrayColor()
    goal.font = UIFont.systemFontOfSize(14)
    goal.lineBreakMode = .ByWordWrapping
    goal.numberOfLines = 0
    self.view.addSubview(goal)
    
    goal.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(gameCategory.snp_bottom).offset(16)
      make.width.equalTo(gameTitle)
      make.centerX.equalTo(self.view)
    }
    
    // Game Rules
    rules.text = passedData!["rules"] as? String
    rules.textColor = UIColor.darkGrayColor()
    rules.font = UIFont.systemFontOfSize(14)
    rules.lineBreakMode = .ByWordWrapping
    rules.numberOfLines = 0
    self.view.addSubview(rules)
    
    rules.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(goal.snp_bottom).offset(16)
      make.width.equalTo(gameTitle)
      make.centerX.equalTo(self.view)
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
