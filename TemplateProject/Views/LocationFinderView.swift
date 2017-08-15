//
//  LocationFinderView.swift
//  TemplateProject
//
//  Created by Steven McFarlane on 7/31/17.
//  Copyright © 2017 Adam Arthur. All rights reserved.
//

import UIKit

class LocationFinderView : UIViewController {
    let circle = CircleControl()
    var animateCircle = false
    let personImage = UIImageView(image: UIImage(named: "Face.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        let squareWidth: CGFloat = 250
    
        let (x, y) = self.centerPoint(width: squareWidth)
        
        personImage.layer.cornerRadius = squareWidth / 2
        personImage.layer.masksToBounds = true
        personImage.frame = CGRect(x: x, y: y, width: squareWidth, height: squareWidth)
        personImage.backgroundColor = UIColor.red
        view.addSubview(personImage)
        
//        let myPanRecognizier = UIPanGestureRecognizer(target: self, action: #selector(LocationFinderView.pan))
//        personImage.addGestureRecognizer(myPanRecognizier)
        
//        let (x2, y2) = self.centerPoint(width: 100)
//        circle.frame = CGRect(x: x2, y: y2, width: 100, height: 100)
//        circle.backgroundColor = UIColor.clear
//        view.addSubview(circle)
        
//        let myPanRecognizier2 = UIPanGestureRecognizer(target: self, action: #selector(LocationFinderView.pan))
//        circleControl.addGestureRecognizer(myPanRecognizier2)
        
//        let myImageTouchRecognizier = UITapGestureRecognizer(target: personImage, action: #selector(LocationFinderView.tapImage))
//        view.addGestureRecognizer(myImageTouchRecognizier)
        print("Test")
    }
    
    func fadeOut(circle: UIView) {
        UIView.animate(withDuration: 3.5, delay: 0.2, options: .curveEaseOut, animations: {
            let bigWidth = self.view.frame.width * 2
            let (x3, y3) = self.centerPoint(width: bigWidth)
            circle.frame = CGRect(x: x3, y: y3, width: bigWidth, height: bigWidth)
            circle.alpha = 0
            circle.layer.cornerRadius = bigWidth / 2
        }, completion: { (finished: Bool) in
            if (self.animateCircle) {
                self.fadeIn(circle: circle)
            }
        })
    }
    
    func fadeIn(circle: UIView) {
        UIView.animate(withDuration: 3.5, delay: 0.2, options: .curveEaseIn, animations: {
            let smallWidth = self.view.frame.width * 0.1
            let (x4, y4) = self.centerPoint(width: smallWidth)
            circle.frame = CGRect(x: x4, y: y4, width: smallWidth, height: smallWidth)
            circle.alpha = 1
            circle.layer.cornerRadius = smallWidth / 2
        }, completion: {(finished: Bool) in
            if (self.animateCircle) {
                self.fadeOut(circle: circle)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch: UITouch = touches.first!
        if (touch.view == self.personImage) {
            self.fadeOut(circle: self.personImage)
            self.animateCircle = !self.animateCircle
        }
    }
    
//    func tapImage(gestureRecognizier: UITapGestureRecognizer) {
//        print("tapped!!!!")
//    }
    func pan(GestureRecognizer: UIPanGestureRecognizer)
    {
        print("Draggable!!!")
        if GestureRecognizer.state == .began || GestureRecognizer.state == .changed {
            
            let translation = GestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            GestureRecognizer.view!.center = CGPoint(x: GestureRecognizer.view!.center.x + translation.x, y: GestureRecognizer.view!.center.y + translation.y)
            GestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    func centerPoint(width: CGFloat) -> (CGFloat, CGFloat) {
        let x = (view.frame.width / 2) - (width / 2)
        let y = (view.frame.height / 2) - (width / 2)
        return (x, y)
    }
}
