//
//  ViewController.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 10/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadData(completed: @escaping DownloadComplete){
        Alamofire.request(URL(string: "https://www.google.dk")!).responseJSON { (response) in
            let result = response.result
            
            if let resDict = result.value as? Dictionary<String, Any> {
                if let cities = resDict["Cities"] as? [Dictionary<String, Any>] {
                    for city in cities {
                        self.cities.append(City(dict: city))
                    }
                }
            }
        }
    }
}

/*
 
 {
    "Cities" : [
        {"Name": "Københaven", "GeoLat": 0.0, "GeoLng": 0.0},
        {"Name": "Odense", "GeoLat": 0.0, "GeoLng": 0.0},
        {"Name": "Århus", "GeoLat": 0.0, "GeoLng": 0.0}
    ]
 }
 
 
 
 */
