//
//  GameTypeCreationViewController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/11/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import QuartzCore

class GameTypeCreationViewController: UIViewController, UITextFieldDelegate {

  lazy var gameTitle = UITextField()
  lazy var gameCategory = UITextField()
  lazy var goal = UITextView()
  lazy var rules = UITextView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Create Game"
    
    initializeView()
  }

  func initializeView() {
    self.view.backgroundColor = UIColor.whiteColor()
    
    // Game Title
    gameTitle.placeholder = "Game Type Title"
    gameTitle.layer.cornerRadius = 6
    gameTitle.layer.masksToBounds = true
    gameTitle.layer.borderColor = UIColor.lightGrayColor().CGColor
    gameTitle.layer.borderWidth = 1.0
    gameTitle.leftViewMode = UITextFieldViewMode.Always
    let titleSpacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:0))
    gameTitle.leftView = titleSpacerView
    gameTitle.textColor = UIColor.darkGrayColor()
    gameTitle.delegate = self
    self.view.addSubview(gameTitle)
    
    gameTitle.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(self.view).offset(32)
      make.width.equalTo(self.view).offset(-32)
      make.height.equalTo(44)
      make.centerX.equalTo(self.view)
    }
    
    // Game Category
    gameCategory.placeholder = "Game Category (Elimination)"
    gameCategory.layer.cornerRadius = 6
    gameCategory.layer.masksToBounds = true
    gameCategory.layer.borderColor = UIColor.lightGrayColor().CGColor
    gameCategory.layer.borderWidth = 1.0
    gameCategory.leftViewMode = UITextFieldViewMode.Always
    let categorySpacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:0))
    gameCategory.leftView = categorySpacerView
    gameCategory.textColor = UIColor.darkGrayColor()
    gameCategory.delegate = self
    self.view.addSubview(gameCategory)
    
    gameCategory.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(gameTitle.snp_bottom).offset(16)
      make.width.equalTo(self.view).offset(-32)
      make.height.equalTo(44)
      make.centerX.equalTo(self.view)
    }
    
    // Game Goal
    self.view.addSubview(goal)
    
    goal.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(gameCategory.snp_bottom).offset(16)
      make.width.equalTo(self.view).offset(-32)
      make.centerX.equalTo(self.view)
    }
    
    // Game Rules
    self.view.addSubview(rules)
    
    rules.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(goal.snp_bottom).offset(16)
      make.width.equalTo(self.view).offset(-32)
      make.centerX.equalTo(self.view)
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
