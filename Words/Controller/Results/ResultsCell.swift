//
//  ResultsCell.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    
    func setupCell(with result: SearchResponseElement) {
        self.resultLabel.text = result.text
    }

}
