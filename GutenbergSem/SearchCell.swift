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
    
    func configureCell (city: City) {
        nameLbl.text = city.Name
    }

}
