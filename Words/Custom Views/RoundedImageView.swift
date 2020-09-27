//
//  RoundedImageView.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }

}
