//
//  stressedView.swift
//  mental-health-app
//
//  Created by Aspen Hsu on 5/2/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import Foundation
import UIKit

class stressedView: UIViewController{
    
    var thisMood : String?
    
    
    @IBAction func stressToMusic(_ sender: Any) {
     performSegue(withIdentifier: "stressToMusic", sender: self)
        
    }
    @IBOutlet weak var stressLabel: UILabel!
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        stressLabel.text = "Yes, life and school can get very stressful.  Remember that it is always okay to take a break!"
        stressLabel.textAlignment = .center
        stressLabel.font = UIFont(name: "Noteworthy-Bold", size: 25)
        stressLabel.numberOfLines = 0
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "stressToMusic" {
                if let dest = segue.destination as? MusicTableViewController {
                    dest.songs = songDictionary[thisMood!]!
                }

}
}
}
}
