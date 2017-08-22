//
//  CollectPhoneNumberControl.swift
//  TemplateProject
//
//  Created by Steven McFarlane on 8/21/17.
//  Copyright © 2017 Adam Arthur. All rights reserved.
//

import Foundation
import UIKit

class CollectPhoneNumberControl: UIView {
  let instructionMessageText = "What is your phone number?"
  let instructionLabel = UILabel()
  let textBox = UITextField()
  var callbacks: [(_ text: String)->()] = [{text in print("callback called: \(text)")}]
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    instructionLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height / 2)
    instructionLabel.text = instructionMessageText
    instructionLabel.textAlignment = .left
    instructionLabel.lineBreakMode = .byWordWrapping
    instructionLabel.numberOfLines = 2
    instructionLabel.font = UIFont.systemFont(ofSize: 32.0)
    self.addSubview(instructionLabel)
    textBox.frame = CGRect(x: 0, y: self.bounds.height / 2, width: self.bounds.width, height: self.bounds.height / 2)
    textBox.placeholder = "(888) 123-4567"
    textBox.backgroundColor = UIColor.clear
    textBox.borderStyle = .none
    textBox.font = UIFont.systemFont(ofSize: 28.0)
    textBox.becomeFirstResponder()
    textBox.keyboardType = .numberPad
    textBox.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
    self.addSubview(textBox)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addCallback(callback: @escaping (_ text: String)->()) {
    self.callbacks.append(callback)
  }
  
  func textChanged(_ textField: UITextField) {
    callbacks.forEach { cb in cb(textField.text!) }
  }
}
