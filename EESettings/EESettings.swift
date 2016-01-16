//
//  EESettingsViewController.swift
//  LTS
//
//  Created by Erk EKİN on 14/01/16.
//  Copyright © 2016 innova. All rights reserved.
//

import UIKit
class Preferences:NSObject{
  
    
    static func setHostView() -> EESettings{
        
        let settingsView = NSBundle.mainBundle().loadNibNamed("EESettings", owner: self, options: nil).first as! EESettings
        settingsView.layer.cornerRadius = 20
        settingsView.layer.masksToBounds = true
        settingsView.layer.zPosition = 10000;
        settingsView.backgroundColor = UIColor(red:0.24, green:0.75, blue:1, alpha:1)
        
        #if DEBUG
            
            let window = UIApplication.sharedApplication().keyWindow
            print(window)
            window?.addSubview(settingsView)
            
            let panRecognizer = UIPanGestureRecognizer(target:settingsView, action:"detectPan:")
            settingsView.addGestureRecognizer(panRecognizer)
            settingsView.label!.text = EESettings.readHost()
            
            NSNotificationCenter.defaultCenter().addObserver(settingsView, selector:"renewSettings", name:
                UIApplicationDidBecomeActiveNotification, object: nil)
            
        #endif
        return settingsView
        
    }
    
}
class EESettings:UIView {
    
    var lastLocation:CGPoint = CGPointMake(0, 0)
    
    @IBOutlet var label:UILabel?
    
    static func readHost() -> String{
        
        let defaultHost = "localhost"
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let selected_host = defaults.objectForKey("selected_host") as? String ?? String()
        let manuel_host = defaults.objectForKey("manuel_host") as? String ?? String()
        let httpsIsEnabled = defaults.objectForKey("httpsIsEnabled") as? Bool ?? Bool()
        let httpPrefix = httpsIsEnabled ? "https://":"http://"
        let host = manuel_host == "" ? selected_host:manuel_host
        
        return "\(httpPrefix)\(host == "" ? defaultHost:host)"
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    func renewSettings(){
        
        label!.text = EESettings.readHost()
        
    }
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    @IBAction func close(){
        
        // self.alpha = (self.alpha == 0.5 ? 1:0.5)
        removeFromSuperview()
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.center = CGPointMake(self.lastLocation.x + translation.x, self.lastLocation.y + translation.y)
        }
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        print(self.gestureRecognizers)
        // Remember original location
        lastLocation = self.center
        
    }
}
