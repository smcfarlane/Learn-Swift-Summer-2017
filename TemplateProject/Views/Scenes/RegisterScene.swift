//
//  RegisterScene.swift
//  TemplateProject
//
//  Created by Steven McFarlane on 8/7/17.
//  Copyright © 2017 Adam Arthur. All rights reserved.
//

import UIKit

class RegisterScene: UIController, SuccessionOfImagesDelagate, FancyBoolDelegate, CameraControlDelegate {
  var countdownButton: UIButton? = nil
  var countdownImages: Array<String> = ["3.png", "2.png", "1.png"]
  var countdownCtrl: SuccessionOfImagesControl? = nil
  var acceptCtrl: FancyBoolControl? = nil
  var cameraCtrl: CameraControl?
  var avatarControl: CircleAvatarControl?
  let phoneForm = UIView()
  var phoneCtrl: CollectPhoneNumberControl?
  var avatarImage: UIImage?
  var phoneNumber: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.addBackgroundImage()
    countdownButton = addCountdownButton(frame: CGRect(x: (view.frame.width / 2) - 115, y: view.frame.height * 0.6, width: 230, height: 50))
    countdownCtrl = SuccessionOfImagesControl(frame: CGRect(x: (view.frame.width / 2) - 50, y: view.frame.height * 0.6, width: 100, height: 150), imagesArray: self.countdownImages)
    countdownCtrl?.delagate = self
    view.addSubview(countdownCtrl!)
    self.acceptCtrl = FancyBoolControl(point: CGPoint(x: (view.frame.width / 2) - 100, y: view.frame.height * 0.6))
    acceptCtrl?.isHidden = true
    acceptCtrl?.delegate = self
    view.addSubview(acceptCtrl!)
    self.cameraCtrl = CameraControl(frame: CGRect(x: centerWidth(300), y: -300, width: 300, height: 300))
    self.cameraCtrl?.delegate = self
    view.addSubview(cameraCtrl!)
    self.avatarControl = CircleAvatarControl(frame: CGRect(x: self.centerWidth(300), y: self.view.frame.height * 0.1, width: 300, height: 300))
    self.avatarControl?.isHidden = true
    view.addSubview(self.avatarControl!)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func addCountdownButton(frame: CGRect) -> UIButton {
    let button = addButton(title: "Start Countdown", image: "count-down-button-bg", #selector(RegisterScene.tapStartCountdown))
    button.frame = CGRect(x: (view.frame.width / 2) - 115, y: view.frame.height * 0.6, width: 230, height: 50)
    return button
  }
  
  func addPhoneForm() {
    let frame = CGRect(x: self.centerWidth(self.view.frame.width - 40), y: self.view.frame.height * 1.1, width: self.view.frame.width - 40, height: 250)
    self.phoneForm.frame = frame
    let avatar = CircleAvatarControl(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    avatar.setImage(image: self.avatarImage!)
    avatar.setBorder(size: 2.0)
    self.phoneForm.addSubview(avatar)
    self.phoneCtrl = CollectPhoneNumberControl(frame: CGRect(x: 0, y: 50, width: frame.width, height: frame.height - 50))
    self.phoneCtrl?.addCallback(callback: {text in self.phoneNumber = text; print("phone number: \(self.phoneNumber!)")})
    self.phoneForm.addSubview(self.phoneCtrl!)
    self.view.addSubview(self.phoneForm)
  }
  
  func showCameraView() {
    UIView.animate(withDuration: 0.5, animations: {
      self.cameraCtrl?.frame = CGRect(x: self.centerWidth(300), y: self.view.frame.height * 0.1, width: 300, height: 300)
    })
  }
  
  func hideAvatarView() {
    UIView.animate(withDuration: 0.5, animations: {
      self.avatarControl?.frame = CGRect(x: self.centerWidth(300), y: -300, width: 300, height: 300)
    }, completion: {_ in
      self.avatarControl?.isHidden = true
      self.avatarControl?.frame = CGRect(x: self.centerWidth(300), y: self.view.frame.height * 0.1, width: 300, height: 300)
    })
  }
  
  func showPhoneCtrl() {
    UIView.animate(withDuration: 0.5, animations: {
      self.phoneForm.frame = CGRect(x: self.centerWidth(self.view.frame.width - 40), y: self.centerHeight(200), width: self.view.frame.width - 40, height: 250)
    })
  }
  
  func tapStartCountdown() {
    self.showCameraView()
    UIView.animate(withDuration: 0.75, animations: {
      self.countdownButton?.alpha = 0
    }, completion: {_ in self.countdownCtrl?.startAnimation()})
  }
  
  func runCompleted() {
    self.cameraCtrl?.captureImage()
    self.acceptCtrl?.showCtrl()
  }
  
  func actionTaken(result: Bool) {
    self.acceptCtrl?.hideCtrl()
    if result {
      self.addPhoneForm()
      self.hideAvatarView()
      self.showPhoneCtrl()
    } else {
      self.cameraCtrl?.initializeCamera()
      self.hideAvatarView()
      view.addSubview(self.cameraCtrl!)
      UIView.animate(withDuration: 0.75, animations: {
        self.countdownButton?.alpha = 1
      })
    }
  }
  
  func getImage(image: UIImage) {
    self.avatarImage = image
    self.avatarControl?.setImage(image: image)
    self.avatarControl?.isHidden = false
    self.cameraCtrl?.removeFromSuperview()
    self.cameraCtrl?.frame = CGRect(x: centerWidth(300), y: -300, width: 300, height: 300)
  }
}
