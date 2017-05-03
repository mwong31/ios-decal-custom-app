//
//  tiredView.swift
//  mental-health-app
//
//  Created by Aspen Hsu on 5/1/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import Foundation
import UIKit

class tiredView: UIViewController {
    
    @IBAction func musicButton(_ sender: Any) {
        performSegue(withIdentifier: "fromTiredToMusic", sender: self)
    }
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    var thisMood: String?
    
    @IBAction func goToMusic(_ sender: Any) {
        let url1 = URL(string: "http://www.webmd.com/sleep-disorders/features/natural-solutions#1")!
        UIApplication.shared.open(url1, options: [:], completionHandler: nil)
        
        
    }
    @IBOutlet weak var tiredLABEL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tiredLABEL.text = "Sleep is very important. You should go to bed, and try to limit so called sleep alternatives such as 5 hour energy"
        tiredLABEL.textAlignment = .center
        tiredLABEL.font = UIFont(name: "Noteworthy-Bold", size: 25)
        tiredLABEL.numberOfLines = 0
        tiredLABEL.textColor = .white
        
        linkLabel.text =  "for natural insomnia remedies press the flower"
        linkLabel.textAlignment = .center
        linkLabel.font = UIFont(name: "Noteworthy-Bold", size: 15)
        linkLabel.numberOfLines = 0
        linkLabel.textColor = .white
        
        musicLabel.text = "to listen to relaxing music press button"
        musicLabel.textAlignment = .center
        musicLabel.font = UIFont(name: "Noteworthy-Bold", size: 15)
        musicLabel.numberOfLines = 0
        musicLabel.textColor = .white
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "fromTiredToMusic" {
                if let dest = segue.destination as? MusicTableViewController {
                    dest.songs = songDictionary[thisMood!]!
                }
            }
        }
    }

    
    
}
