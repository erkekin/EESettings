//
//  ViewController.swift
//  MyNetworkingApp
//
//  Created by Erk EKİN on 16/01/16.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        SettingHost.setHostView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

