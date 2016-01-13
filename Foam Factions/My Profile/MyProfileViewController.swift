//
//  MyProfileViewController.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/8/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import ImagePicker
import Parse

class MyProfileViewController: UIViewController, ImagePickerDelegate {

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var phoneNumber: UILabel!
  
  var imagePickerController = ImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "My Profile"
    
    setupProfileImage()
    setupProfile()
    initializeEditProfile()
    getProfile()
  }
  
  func getProfile() {
    let query = PFUser.query
    query()?.findObjectsInBackgroundWithBlock{
      (objects: [PFObject]?, error: NSError?) -> Void in
      if error == nil {
        if let objects = objects {
          for object in objects {
            self.usernameLabel.text = object["firstName"] as? String
            self.phoneNumber.text = object["phoneNumber"] as? String
          }
        }
      } else {
        // Log details of the failure
        print("Error: \(error!) \(error!.userInfo)")
      }
    }
  }
  
  func setupProfile() {
    self.usernameLabel.textColor = UIColor.darkGrayColor()
    self.phoneNumber.textColor = UIColor.darkGrayColor()
  }
  
  // MARK: Edit Profile
  
  func initializeEditProfile() {
    let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editButtonPressed")
    self.navigationItem.setRightBarButtonItem(addButton, animated: true)
  }
  
  func editButtonPressed() {
    print("edit pressed")
  }
  
  // MARK: Profile Image
  
  func setupProfileImage() {
    self.view.backgroundColor = UIColor.whiteColor()
    
    let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("profilePicturePressed"))
    profileImage.userInteractionEnabled = true
    profileImage.addGestureRecognizer(tapGestureRecognizer)
    profileImage.image = UIImage.init(named: "emptyProfile")
    profileImage.layer.cornerRadius = 8
    profileImage.contentMode = .ScaleAspectFill
    profileImage.backgroundColor = UIColor.init(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 1)
  }
  
  func profilePicturePressed() {
    imagePickerController.delegate = self
    imagePickerController.imageLimit = 1
    presentViewController(imagePickerController, animated: true, completion: nil)
  }
  
  func wrapperDidPress(images: [UIImage]) {
  }
  
  func doneButtonDidPress(images: [UIImage]) {
    let selectedImage = images[0]
    roundImageCornersForImageView(selectedImage, imageView: profileImage)
    
    imagePickerController.dismissViewControllerAnimated(true) { () -> Void in}
  }
  
  func cancelButtonDidPress() {
  }
  
  // MARK: Image Processing
  
  func roundImageCornersForImageView(image: UIImage, imageView: UIImageView) {
    // Round corners of image and place inside imageView
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, 0)
    UIBezierPath(roundedRect: imageView.bounds, cornerRadius: 10.0).addClip()
    image.drawInRect(imageView.bounds)
    imageView.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
  }
  
  // MARK: Memory Management
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
