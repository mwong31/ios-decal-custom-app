//
//  MusicTableViewCell.swift
//  mental-health-app
//
//  Created by Marisa Wong on 4/29/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
