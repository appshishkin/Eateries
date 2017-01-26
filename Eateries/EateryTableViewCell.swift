//
//  EateryTableViewCell.swift
//  Eateries
//
//  Created by Александр Шишкин on 20/11/2016.
//  Copyright © 2016 Александр Шишкин. All rights reserved.
//

import UIKit

class EateryTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
