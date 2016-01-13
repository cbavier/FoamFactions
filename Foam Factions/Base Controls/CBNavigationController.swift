//
//  CBNavigationController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/10/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit

class CBNavigationController: UINavigationController {

    override func viewDidLoad() {
      super.viewDidLoad()
      
      // Setup Custom Navigation Bar Colors
      self.navigationBar.tintColor = UIColor.whiteColor()
      self.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 33/255.0, green: 150/255.0, blue: 243/255.0, alpha: 1.0)
      self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
      self.navigationBar.translucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
