//
//  ViewController.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 10/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import UIKit
import Alamofire

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

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
        searchBar.delegate = self
    }
    
    func downloadData(completed: @escaping DownloadComplete){
        switch segControl.selectedSegmentIndex {
        case 0:
            searchByCity {
                completed()
            }
            break
        case 2:
            searchByBook {
                self.performSegue(withIdentifier: "MapVC", sender: nil)
            }
        default:
            break
        }
    }
    
    func searchByCity(completed: @escaping DownloadComplete){
        Alamofire.request(Urlbuilder.searchByCityMySqlUrl(city: searchBar.text!)).responseJSON { (response) in
            let result = response.result
            
            if let list = result.value as? [Dictionary<String, Any>] {
                for dict in list {
                    self.books.append(Book(dict: dict))
                }
            }
            completed()
        }
    }
    
    func searchByBook(completed: @escaping DownloadComplete){
        Alamofire.request(Urlbuilder.searchByBookMySqlUrl(book: searchBar.text!)).responseJSON { (response) in
            let result = response.result
            
            if let list = result.value as? [Dictionary<String, Any>] {
                for dict in list {
                    self.cities.append(City(dict: dict))
                }
            }
            completed()
        }

    }
    
//
//    func downloadData(completed: @escaping DownloadComplete){
//        
//        
//        
//        cities.append(City(name: "København"))
//        cities.append(City(name: "Odense"))
//        cities.append(City(name: "Århus"))
//        cities.append(City(name: "Stockholm"))
//        cities.append(City(name: "Oslo"))
//        books.append(Book(name: "Harry Potter"))
//        books.append(Book(name: "Kaptajn Nemo"))
//        books.append(Book(name: "Flaskehalsen"))
//        books.append(Book(name: "MacBook"))
//        
//        
//        
//        completed()
//        
//        
//        
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
        
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
        cell.configureCell(book: books[indexPath.row])
        
//        switch segControl.selectedSegmentIndex {
//        case 0:
//            cell.configureCell(city: cities[indexPath.row])
//            break
//        case 1:
//            cell.configureCell(book: books[indexPath.row])
//            break
//        case 2:
//            cell.configureCell(author: author[indexPath.row])
//            break
//        default: break
//            
//        }
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        clearData()
        
        searchBar.resignFirstResponder()
        
        downloadData {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MapVC {
            vc.cities = cities
        }
    }
    
    
    @IBAction func segChangedValue(_ sender: Any) {
        clearData()
        searchBar.text = nil
        self.tableView.reloadData()
    }
    
    private func clearData(){
        books = [Book]()
        author = [Author]()
        cities = [City]()
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
