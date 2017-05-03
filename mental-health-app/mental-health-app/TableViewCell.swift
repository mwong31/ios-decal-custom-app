//
//  TableViewCell.swift
//  mental-health-app
//
//  Created by Aspen Hsu on 4/24/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var actImage: UIImageView!
    @IBOutlet weak var activityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
