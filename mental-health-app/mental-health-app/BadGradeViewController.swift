//
//  badGrade.swift
//  mental-health-app
//
//  Created by Aspen Hsu on 4/25/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import Foundation
import StoreKit
import MediaPlayer

class BadGradeViewController: UIViewController {

    @IBOutlet weak var label_bad: UILabel!
    
    override func viewDidLoad() {
        label_bad.text = "Okay, don't panic! Everyone gets a bad grade at some point in their lives, the important thing is to remember that this one test grade doesn't define you"
        label_bad.textAlignment = .center
        label_bad.font = UIFont(name: "Noteworthy-Bold", size: 25)
        label_bad.numberOfLines = 0
        label_bad.textColor = .white
    }

}
    

