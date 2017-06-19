//
//  ViewController.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var longLogo: UIImageView!
    @IBOutlet weak var shortLogo: UIImageView!
    
    let shortLogoDuration = 2.0
    let longLogoDuration = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shortLogo.alpha = 0.0
        longLogo.alpha = 0.0
        
        animateShortLogo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateShortLogo() {
        shortLogo.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        UIView.animate(withDuration: shortLogoDuration, animations: {
            self.shortLogo.alpha = 1.0
            self.shortLogo.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (finished) in
            self.animateLongLogo()
        }
    }

    func animateLongLogo() {
        UIView.animate(withDuration: longLogoDuration, animations: {
            self.longLogo.alpha = 1.0
        }) { (finished) in
            self.triggerTimer()
        }
    }
    
    func triggerTimer() {
        let delayTimer = Timer(timeInterval: 0.5, repeats: false, block: { (timer) in
            
            timer.invalidate()
            
//            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            let navController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = navController
            appDelegate.window?.makeKeyAndVisible()
        })
        RunLoop.current.add(delayTimer, forMode: RunLoopMode.commonModes)
    }
}

