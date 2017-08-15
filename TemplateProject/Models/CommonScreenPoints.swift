//
//  CommonScreenPoints.swift
//  TemplateProject
//
//  Created by Steven McFarlane on 8/2/17.
//  Copyright © 2017 Adam Arthur. All rights reserved.
//

import UIKit

enum CommonPoints {
  case LEFTTOP, CENTERTOP, RIGHTTOP, LEFTCENTER, CENTERSCREEN, RIGHTCENTER, CENTERBOTTOM, LEFTBOTTOM, RIGHTBOTTOM
}

class CommonScreenPoints {
  static func commonPoint(pointName: CommonPoints) -> CGPoint {
    switch(pointName) {
    case .LEFTTOP:
      return CGPoint(x: 0, y: 0)
    case .CENTERTOP:
      return CGPoint(x: 0, y: 0)
    case .RIGHTTOP:
      return CGPoint(x: 0, y: 0)
    case .LEFTCENTER:
      return CGPoint(x: 0, y: 0)
    case .CENTERSCREEN:
      return CGPoint(x: 0, y: 0)
    case .RIGHTCENTER:
      return CGPoint(x: 0, y: 0)
    case .LEFTBOTTOM:
      return CGPoint(x: 0, y: 0)
    case .CENTERBOTTOM:
      return CGPoint(x: 0, y: 0)
    case .RIGHTBOTTOM:
      return CGPoint(x: 0, y: 0)
    }
  }
}
