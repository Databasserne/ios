//
//  SearchCell.swift
//  GutenbergSem
//
//  Created by Jonas Simonsen on 17/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var authorLbl :UILabel!
    
    func configureCell (book: Book) {
        nameLbl.text = book.Name
        authorLbl.text = book.Auth.Name
    }
}
