//
//  ViewController.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 10/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import UIKit
import Alamofire

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cities = [City]()
    var books = [Book]()
    var author = [Author]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        downloadData {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func downloadData(completed: @escaping DownloadComplete){
//        Alamofire.request(URL(string: "https://www.google.dk")!).responseJSON { (response) in
//            let result = response.result
//            
//            if let resDict = result.value as? Dictionary<String, Any> {
//                if let cities = resDict["Cities"] as? [Dictionary<String, Any>] {
//                    for city in cities {
//                        self.cities.append(City(dict: city))
//                    }
//                }
//                
//                if let books = resDict["Books"] as? [Dictionary<String, Any>] {
//                    for book in books {
//                        self.books.append(Book(dict: book))
//                    }
//                }
//                
//                if let authors = resDict["Authors"] as? [Dictionary<String, Any>] {
//                    for author in authors {
//                        self.author.append(Author(dict: author))
//                    }
//                }
//             }
//        }
//    }
    
    func downloadData(completed: @escaping DownloadComplete){
        cities.append(City(name: "København"))
        cities.append(City(name: "Odense"))
        cities.append(City(name: "Århus"))
        cities.append(City(name: "Stockholm"))
        cities.append(City(name: "Oslo"))
        books.append(Book(name: "Harry Potter"))
        books.append(Book(name: "Kaptajn Nemo"))
        books.append(Book(name: "Flaskehalsen"))
        books.append(Book(name: "MacBook"))
        
        
        
        completed()
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segControl.selectedSegmentIndex {
        case 0:
            return cities.count
        case 1:
            return books.count
        case 2:
            return author.count
        default:
            return 0
        }
            
        }
        
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        switch segControl.selectedSegmentIndex {
        case 0:
            cell.configureCell(city: cities[indexPath.row])
            break
        case 1:
            cell.configureCell(book: books[indexPath.row])
            break
        case 2:
            cell.configureCell(author: author[indexPath.row])
            break
        default: break
            
        }
        
        return cell
            
    }
    
    @IBAction func segChangedValue(_ sender: Any) {
        
        tableView.reloadData()
    }
}

/*
 
 {
    "Cities" : [
        {"Name": "Københaven", "GeoLat": 0.0, "GeoLng": 0.0},
        {"Name": "Odense", "GeoLat": 0.0, "GeoLng": 0.0},
        {"Name": "Århus", "GeoLat": 0.0, "GeoLng": 0.0}
    ],
 
 
    "Book" : [
        {"Name": "Harry Potter 1", "Author": "J. K. Rowling"}
        {"Name": "Harry Potter 2", "Author": "J. K. Rowling"}
        {"Name": "Harry Potter 3", "Author": "J. K. Rowling"}
    ],
 
    "Aither" : [
        {"Name": "J. K. Rowling, "Books": "Harry Potter 1"}
    ]
 
 }
 
 
 
 */
