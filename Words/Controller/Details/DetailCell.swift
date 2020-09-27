//
//  DetailCell.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit
import Kingfisher

class DetailCell: UITableViewCell {

    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var meaningImage: RoundedImageView!
    
    func setupCell(with meaning: Meaning) {
        self.meaningLabel.text = meaning.translation.text
        self.meaningImage.kf.setImage(with: URL(string: "https:\(meaning.imageURL)"), placeholder: UIImage(named: "translate"))
    }
    
}
