//
//  ViewController.swift
//  Frames
//
//  Created by Alan Aumiller II on 1/21/20.
//  Copyright © 2020 Alan Aumiller II. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    
    var counter = 1
    
    var timer = Timer()
    
    var isAnimating = false
    
    var isMoving = false
    
    var isBack : Bool = false
    
    //Individual Animations
    
    //Fade In
    @IBAction func fadeIn(_ sender: Any) {
        
        imageView.alpha = 0
        
        UIView.animate(withDuration: 3, animations: {
            self.imageView.alpha = 1
        })
    }
    
    //Slide In
    @IBAction func slide(_ sender: Any) {
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        
        UIView.animate(withDuration: 1.5) {
            self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
        }
    }
    
    //Grow
    @IBAction func grow(_ sender: Any) {
        
        let origin : CGRect = imageView.frame
        
        imageView.frame = CGRect(x: 200, y: 400, width: 0, height: 0)
        
        UIView.animate(withDuration: 3) {
            self.imageView.frame = origin
        }
        
    }
    
    //Move
    @IBAction func move(_ sender: Any) {
        
  if  isBack == false
           {
                isBack = true
                UIView.animate(withDuration: 1, animations: {self.imageView.frame.origin.y -= 200
               }, completion: nil)
           }
           else
           {
                isBack = false
                UIView.animate(withDuration: 1, animations: {self.imageView.frame.origin.y += 200
               }, completion: nil)
           }

        }
    
    //Rotate
    @IBAction func rotate(_ sender: Any) {
        
        imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi / 1))

        UIView.animate(withDuration: 1.0, animations: {
            self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(Double.pi / 1))
        })
    }
    
    //Individual Animatons End
    
    
    //Main Animation
    
    @objc func animate() {
        
        imageView.image = UIImage(named: "\(counter).gif")
            
            counter += 1
            
            if counter == 15 {
                counter = 0
            }
    }
    
    @IBOutlet weak var button: UIButton!
    @IBAction func nextbutton(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            button.setTitle("Start Animation", for: [])
            isAnimating = false
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("Stop Animation", for: [])
            
            isAnimating = true
            
        }
        
        imageView.image = UIImage(named: "\(counter).gif")
        
        counter += 1
        
        if counter == 15 {
            counter = 0
        }
        
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

