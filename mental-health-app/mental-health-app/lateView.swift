//
//  lateView.swift
//  mental-health-app
//
//  Created by Aspen Hsu on 5/2/17.
//  Copyright © 2017 Marisa Wong. All rights reserved.
//

import Foundation
import UIKit

class lateView: UIViewController{
    @IBOutlet weak var lateLabel: UILabel!
    @IBAction func lateButton3(_ sender: Any) {
        let url1 = URL(string: "http://www.huffingtonpost.com/ann-davis/how-to-stop-being-late-fo_b_7631186.html")!
        UIApplication.shared.open(url1, options: [:], completionHandler: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lateLabel.text = "Let me link you to some help!"
        lateLabel.textAlignment = .center
        lateLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        lateLabel.numberOfLines = 4
    }
}
