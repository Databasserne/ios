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
        case 1:
            searchByAuthor {
                completed()
            }
            break
        case 2:
            searchByBook(book: searchBar.text!, completed: {
                self.performSegue(withIdentifier: "MapVC", sender: nil)
            })
        case 3:
            searchByGeolocation {
                completed()
            }
        default:
            break
        }
    }
    
    func searchByCity(completed: @escaping DownloadComplete){
        Alamofire.request(Urlbuilder.searchByCityUrl(city: searchBar.text!)).responseJSON { (response) in
            let result = response.result
            
            if let list = result.value as? [Dictionary<String, Any>] {
                for dict in list {
                    self.books.append(Book(dict: dict))
                }
            }
            completed()
        }
    }
    
    func searchByAuthor(completed: @escaping DownloadComplete){
        Alamofire.request(Urlbuilder.searchByAuthorUrl(author: searchBar.text!)).responseJSON { (response) in
            let result = response.result
            
            if let list = result.value as? [Dictionary<String, Any>] {
                for dict in list {
                    let b = Book(dict: dict)
                    var c = false
                    for bk in self.books {
                        c = bk.Name == b.Name
                        if c {
                            break;
                        }
                    }
                    if !c {
                        self.books.append(Book(dict: dict))
                    }
                }
            }
            completed()
        }
    }
    
    func searchByBook(book: String, completed: @escaping DownloadComplete){
        Alamofire.request(Urlbuilder.searchByBookUrl(book: book)).responseJSON { (response) in
            let result = response.result
            
            if let list = result.value as? [Dictionary<String, Any>] {
                for dict in list {
                    self.cities.append(City(dict: dict))
                }
            }
            completed()
        }
    }
    
    func searchByGeolocation(completed: @escaping DownloadComplete){
        let geoloc = searchBar.text?.components(separatedBy: "/")
        Alamofire.request(Urlbuilder.searchByGeolocation(lat: (geoloc?[0])!, lng: (geoloc?[1])!)).responseJSON { (response) in
            let result = response.result
            
            if let list = result.value as? [Dictionary<String, String>] {
                for dict in list {
                    self.books.append(Book(dict: dict))
                }
            }
            
            completed()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchByBook(book: books[indexPath.row].Name, completed: { 
            self.performSegue(withIdentifier: "MapVC", sender: nil)
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
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
