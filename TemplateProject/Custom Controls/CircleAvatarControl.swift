//
//  CircleAvatarControl.swift
//  TemplateProject
//
//  Created by Steven McFarlane on 8/14/17.
//  Copyright © 2017 Adam Arthur. All rights reserved.
//

import UIKit

class CircleAvatarControl: UIView {
  let imageView = UIImageView()
  var borderWidth = CGFloat(10.0)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.clear
    imageView.isHidden = true
    imageView.clipsToBounds = true
    imageView.layer.borderColor = UIColor.white.cgColor
    imageView.frame = self.bounds
    imageView.layer.cornerRadius = self.frame.width / 2
    imageView.layer.borderWidth = borderWidth
    self.addSubview(imageView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  func setImage(image: UIImage) {
    imageView.image = image
    imageView.isHidden = false
  }
  
  func setBorder(size: CGFloat) {
    imageView.layer.borderWidth = size
  }
}
