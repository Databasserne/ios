//
//  SettingsVC.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 24/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var buttonSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        switch DatabaseToUse {
        case .MySql:
            buttonSwitch.isOn = false
        case .Neo4j:
            buttonSwitch.isOn = true
        }
    }
    
    @IBAction func switchButtonChanged (sender: UISwitch) {
        
        if sender.isOn {
            DatabaseToUse = .Neo4j
        }else {
            DatabaseToUse = .MySql
        }
    }
}
