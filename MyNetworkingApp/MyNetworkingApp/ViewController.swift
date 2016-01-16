//
//  ViewController.swift
//  MyNetworkingApp
//
//  Created by Erk EKİN on 16/01/16.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var queryButton: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        Preferences.setHostView()
        queryButton.setTitle("Send a request to \(EESettings.readHost())", forState: .Normal)
        
    }
    
    @IBAction func queryButtonTapped(sender: AnyObject) {
        
        let hostURL = EESettings.readHost()
        print(hostURL)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

