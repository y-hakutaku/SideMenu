//
//  ViewController.swift
//  SideMenu
//
//  Created by Hakutaku on 2018/07/25.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var subMenuContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate var sidemenuInVisible:Bool = true
    
    @IBAction func mainContainerViewPanGesture(_ sender: Any) {
        guard let gesture: UIPanGestureRecognizer = sender as? UIPanGestureRecognizer else {
            return
        }
        
        let move = gesture.translation(in:mainContainerView)
        print(move.x.description)
        
        if sidemenuInVisible {
            if (move.x < 0) {
                return
            }
            mainContainerView.isUserInteractionEnabled = false
            subMenuContainerView.isUserInteractionEnabled = true
            mainContainerView.frame.origin.x = move.x
            subMenuContainerView.frame.origin.x = move.x - 314
        
            if gesture.state == .ended || gesture.state == .cancelled {
                if move.x > view.frame.width/3 {
                    mainContainerView.frame.origin.x = 314
                    subMenuContainerView.frame.origin.x = 0
                    sidemenuInVisible = false
                } else {
                    mainContainerView.isUserInteractionEnabled = true
                    subMenuContainerView.isUserInteractionEnabled = false
                    mainContainerView.frame.origin.x = 0
                    subMenuContainerView.frame.origin.x = -314
                }
            }
            
        } else {
            if (move.x > 0) {
                return
            }
            mainContainerView.isUserInteractionEnabled = true
            subMenuContainerView.isUserInteractionEnabled = false
            mainContainerView.frame.origin.x = move.x + 314
            subMenuContainerView.frame.origin.x = move.x
            
            if gesture.state == .ended || gesture.state == .cancelled {
                if move.x < view.frame.width/3 * -1 {
                    mainContainerView.frame.origin.x = 0
                    subMenuContainerView.frame.origin.x = -314
                    sidemenuInVisible = true
                } else {
                    mainContainerView.isUserInteractionEnabled = false
                    subMenuContainerView.isUserInteractionEnabled = true
                    mainContainerView.frame.origin.x = 314
                    subMenuContainerView.frame.origin.x = 0
                }
            }
        }
        
    }
    
}

